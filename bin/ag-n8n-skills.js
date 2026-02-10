#!/usr/bin/env node

const { program } = require('commander');
const chalk = require('chalk');
const ora = require('ora');
const fs = require('fs-extra');
const path = require('path');

const packageJson = require('../package.json');

// Banner
const banner = `
${chalk.bold.cyan('╔═══════════════════════════════════════════════════════════╗')}
${chalk.bold.cyan('║')}  ${chalk.bold.yellow('⚡')} ${chalk.bold.white('ag-n8n-skills')}                                          ${chalk.bold.cyan('║')}
${chalk.bold.cyan('║')}  ${chalk.dim('AI Agent for production-ready n8n workflows')}              ${chalk.bold.cyan('║')}
${chalk.bold.cyan('╚═══════════════════════════════════════════════════════════╝')}
`;

// Source .agent folder (from package)
const getSourcePath = () => path.join(__dirname, '..', '.agent');

// Target .agent folder (in user's project)
const getTargetPath = (customPath) => {
    const basePath = customPath || process.cwd();
    return path.join(basePath, '.agent');
};

// Check if .agent folder exists
const checkInstallation = (targetPath) => {
    return fs.existsSync(targetPath);
};

// Copy .agent folder
const copyAgentFolder = async (targetPath, options) => {
    const sourcePath = getSourcePath();

    if (!fs.existsSync(sourcePath)) {
        throw new Error('Source .agent folder not found in package');
    }

    await fs.copy(sourcePath, targetPath, {
        overwrite: options.force,
        errorOnExist: !options.force
    });
};

// Init command
async function initCommand(options) {
    if (!options.quiet) {
        console.log(banner);
    }

    const targetPath = getTargetPath(options.path);
    const exists = checkInstallation(targetPath);

    if (exists && !options.force) {
        console.log(chalk.yellow('\n⚠️  .agent folder already exists!'));
        console.log(chalk.dim('   Use --force to overwrite existing installation.\n'));
        process.exit(1);
    }

    if (options.dryRun) {
        console.log(chalk.cyan('\n🔍 Dry run mode - no changes will be made\n'));
        console.log(chalk.dim(`   Source: ${getSourcePath()}`));
        console.log(chalk.dim(`   Target: ${targetPath}`));
        console.log(chalk.dim(`   Force:  ${options.force}`));
        console.log();
        return;
    }

    const spinner = ora({
        text: 'Installing ag-n8n-skills...',
        color: 'cyan'
    }).start();

    try {
        await copyAgentFolder(targetPath, options);

        spinner.succeed(chalk.green('Installation complete!'));

        console.log('\n' + chalk.bold('📦 Installed:'));
        console.log(chalk.dim('   └── .agent/'));
        console.log(chalk.dim('       ├── agents/'));
        console.log(chalk.dim('       │   └── n8n-automation-expert.md'));
        console.log(chalk.dim('       └── .skills/'));
        console.log(chalk.dim('           └── n8n-automation/ (8 skills)'));

        console.log('\n' + chalk.bold('🚀 Quick Start:'));
        console.log(chalk.cyan('   Ask your AI assistant to create n8n workflows!'));
        console.log(chalk.dim('   The agent will automatically be detected.\n'));

    } catch (error) {
        spinner.fail(chalk.red('Installation failed'));
        console.error(chalk.red(`\n   ${error.message}\n`));
        process.exit(1);
    }
}

// Update command
async function updateCommand(options) {
    if (!options.quiet) {
        console.log(banner);
    }

    const targetPath = getTargetPath(options.path);

    if (!checkInstallation(targetPath)) {
        console.log(chalk.yellow('\n⚠️  No existing installation found!'));
        console.log(chalk.dim('   Run "init" command first.\n'));
        process.exit(1);
    }

    // Force update
    options.force = true;
    await initCommand(options);
}

// Status command
function statusCommand(options) {
    if (!options.quiet) {
        console.log(banner);
    }

    const targetPath = getTargetPath(options.path);
    const exists = checkInstallation(targetPath);

    console.log(chalk.bold('\n📊 Status:\n'));

    if (exists) {
        console.log(chalk.green('   ✅ ag-n8n-skills is installed'));
        console.log(chalk.dim(`   📁 Location: ${targetPath}`));

        // Check subdirectories
        const agentsPath = path.join(targetPath, '.agents');
        const skillsPath = path.join(targetPath, '.skills');

        if (fs.existsSync(agentsPath)) {
            const agents = fs.readdirSync(agentsPath).filter(f => f.endsWith('.md'));
            console.log(chalk.dim(`   🤖 Agents: ${agents.length}`));
        }

        if (fs.existsSync(skillsPath)) {
            const skills = fs.readdirSync(skillsPath);
            console.log(chalk.dim(`   🛠️  Skills: ${skills.length}`));
        }
    } else {
        console.log(chalk.yellow('   ⚠️  Not installed'));
        console.log(chalk.dim('   Run: npx ag-n8n-skills init'));
    }

    console.log();
}

// CLI setup
program
    .name('ag-n8n-skills')
    .description('🤖 n8n Automation Expert Agent with Skills for Antigravity IDE')
    .version(packageJson.version);

program
    .command('init')
    .description('Install .agent folder with n8n skills into your project')
    .option('-f, --force', 'Overwrite existing .agent folder')
    .option('-p, --path <path>', 'Install in specific directory')
    .option('-q, --quiet', 'Suppress output')
    .option('-d, --dry-run', 'Preview actions without executing')
    .action(initCommand);

program
    .command('update')
    .description('Update existing installation to latest version')
    .option('-p, --path <path>', 'Update in specific directory')
    .option('-q, --quiet', 'Suppress output')
    .action(updateCommand);

program
    .command('status')
    .description('Check installation status')
    .option('-p, --path <path>', 'Check specific directory')
    .option('-q, --quiet', 'Suppress banner')
    .action(statusCommand);

// Default action (show help with banner)
if (process.argv.length === 2) {
    console.log(banner);
    program.help();
}

program.parse();
