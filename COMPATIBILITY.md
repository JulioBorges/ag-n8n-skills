# AI Coding Assistants Compatibility Guide

> **TL;DR**: Works with Antigravity and Claude Code (zero config), Cursor, Windsurf, Cline, Continue.dev, and Aider. Use `./scripts/convert-to-rules.sh` to auto-convert for non-Antigravity/Claude tools.

This guide explains how to use n8n Antigravity Skills with different AI coding assistants.

---

## ⚡ Quick Start (Any Platform)

### Step 1: Install Skills

```bash
npx ag-n8n-skills init
```

### Step 2: Convert for Your Platform (Optional)

```bash
# Only needed for non-Claude tools
chmod +x scripts/convert-to-rules.sh
./scripts/convert-to-rules.sh
```

**Creates**: `.cursorrules`, `.windsurfrules`, `.clinerules`, `.continuerc.json`, `AIDER_USAGE.md`

### Step 3: Start Using

- **Claude Code/Desktop**: Already works! ✅
- **Cursor/Windsurf**: Restart IDE, then use naturally ✅
- **Cline/Continue**: Reload VSCode, then use commands/references ✅
- **Aider**: See `AIDER_USAGE.md` for commands ✅

---

## 📊 Compatibility Matrix

| AI Assistant | Skills Support | MCP Tools | Auto-detect | Setup Effort |
|--------------|----------------|-----------|-------------|--------------|
| **Antigravity** | ✅ Native | ✅ Native | ✅ Yes | 🟢 Zero |
| **Claude Code** | ✅ Native | ✅ Native | ✅ Yes | 🟢 Zero |
| **Claude Desktop** | ✅ Native | ✅ Native | ✅ Yes | 🟢 Zero |
| **Windsurf** | ✅ Excellent | 🟡 Community | ✅ Yes | 🟢 Minimal |
| **Cursor** | ✅ Excellent | 🟡 Planned | ✅ Yes | 🟢 Minimal |
| **Cline (VSCode)** | 🟡 Good | 🟡 Config | ⚠️ Manual | 🟡 Moderate |
| **Continue.dev** | 🟡 Good | 🟡 Plugin | ⚠️ Manual | 🟡 Moderate |
| **Aider** | 🟡 Manual | ❌ No | ❌ No | 🟠 High |
| **GitHub Copilot** | ❌ No | ❌ No | ❌ No | 🔴 Very High |

---

## 🚀 Quick Setup by Tool

### 1️⃣ Antigravity (Recommended) ⭐

**Status**: Native support, zero configuration

```bash
# Install skills
npx ag-n8n-skills init

# That's it! Antigravity auto-detects .agent/ folder
# Just ask: "Create an n8n workflow for webhook processing"
```

**Features**:
- ✅ Automatic skill detection
- ✅ MCP tools built-in
- ✅ WebFetch available
- ✅ Full template search

---

### 2️⃣ Claude Code

**Status**: Native support, zero configuration

```bash
# Install skills
npx ag-n8n-skills init

# That's it! Claude Code auto-detects .agent/ folder
# Just ask: "Create an n8n workflow for webhook processing"
```

**Features**:
- ✅ Automatic skill detection
- ✅ MCP tools built-in
- ✅ WebFetch available
- ✅ Full template search

---

---

### 3️⃣ Windsurf (Codeium)

**Status**: Excellent support with minimal setup

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Generate Windsurf rules
./scripts/convert-to-rules.sh

# 3. Restart Windsurf
# Now you can reference skills with @ mentions
```

**Features**:
- ✅ `.windsurfrules` support
- ✅ Can reference `.agent/` files
- 🟡 MCP via community plugins
- ✅ Good context understanding

**Usage**:
```
You: "Create webhook workflow @.agent/agents/n8n-automation-expert.md"
Windsurf: [Loads agent and creates workflow]
```

---

### 4️⃣ Cursor (Anysphere)

**Status**: Excellent support with minimal setup

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Generate Cursor rules
./scripts/convert-to-rules.sh

# 3. Reload Cursor window
# Skills now available via @ mentions
```

**Features**:
- ✅ `.cursorrules` support (auto-detected)
- ✅ Can reference skills with @
- 🟡 MCP support coming soon
- ✅ Excellent context handling

**Usage**:
```
You: "Build n8n workflow @n8n-template-search"
Cursor: [Searches templates and builds]
```

---

### 5️⃣ Cline (VSCode Extension)

**Status**: Good support with manual configuration

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Generate Cline rules
./scripts/convert-to-rules.sh

# 3. In VSCode, configure Cline to read .clinerules
```

**Features**:
- 🟡 Manual skill loading (via file reading)
- 🟡 MCP via configuration
- ✅ Good Markdown understanding
- ⚠️ Requires explicit file references

**Usage**:
```
You: "Read .agent/agents/n8n-automation-expert.md then create webhook workflow"
Cline: [Loads agent context and creates workflow]
```

---

### 6️⃣ Continue.dev

**Status**: Good support with configuration

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Generate Continue config
./scripts/convert-to-rules.sh

# 3. Reload VSCode
# Continue.dev will read .continuerc.json
```

**Features**:
- ✅ Context providers for `.agent/` folder
- ✅ Custom commands for common tasks
- 🟡 MCP via plugins
- ✅ Flexible configuration

**Usage**:
```
You: "/n8n-build webhook to Slack"
Continue: [Uses custom command with agent context]
```

**Custom Commands**:
- `/n8n-template-search` - Search templates
- `/n8n-build` - Build workflows
- `/n8n-debug` - Debug workflows

---

### 7️⃣ Aider

**Status**: Manual but functional

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. See AIDER_USAGE.md for instructions

# 3. Load agent manually
aider --read .agent/agents/n8n-automation-expert.md
```

**Features**:
- 🟡 Manual file loading via `--read`
- ❌ No MCP support
- ✅ Excellent Markdown parsing
- ⚠️ Requires command-line flags

**Usage**:
```bash
# Template search
aider --read .agent/skills/n8n-automation/n8n-template-search/SKILL.md

# Then in chat: "Find webhook templates"
```

**See**: `AIDER_USAGE.md` for detailed commands

---

### 8️⃣ GitHub Copilot

**Status**: Limited - not recommended for this use case

Copilot doesn't support:
- ❌ Agent systems
- ❌ Skill loading
- ❌ Context files
- ❌ MCP tools

**Alternative**: Use skills as reference documentation manually.

---

## 🛠️ MCP Tools Setup

### What is MCP?

**Model Context Protocol (MCP)** - Standard for connecting AI assistants to external tools.

n8n-mcp provides:
- `search_templates()` - Search 2,709+ templates
- `search_nodes()` - Find n8n nodes
- `validate_node()` - Validate configurations
- `n8n_create_workflow()` - Deploy workflows
- And more...

### MCP Setup by Tool

#### Claude Code/Desktop (Native)

```json
// ~/.config/claude/config.json
{
  "mcpServers": {
    "n8n-mcp": {
      "command": "npx",
      "args": ["-y", "@leonardsellem/n8n-mcp-server"],
      "env": {
        "N8N_API_URL": "http://localhost:5678/api/v1",
        "N8N_API_KEY": "your-api-key"
      }
    }
  }
}
```

#### Other Tools (Community/Config)

**Windsurf**: Check community plugins for MCP support

**Cursor**: MCP support in development (check roadmap)

**Cline/Continue**: MCP via configuration
```json
{
  "mcp": {
    "servers": {
      "n8n-mcp": {
        "command": "npx",
        "args": ["-y", "@leonardsellem/n8n-mcp-server"]
      }
    }
  }
}
```

**Aider**: No MCP support - use manual WebFetch/API calls

---

## 🔄 Automatic Conversion Script

### What is Conversion?

The `.agent/` format is **universal** (Markdown files), but different AI assistants prefer different formats:

- **Native Format** (`.agent/`): Claude Code, Windsurf, Cursor can read directly
- **Rules Format**: Platform-specific files that the AI reads on startup
- **Config Format**: JSON configurations for advanced tools

**Why convert?**
- ✅ Better auto-detection by the AI
- ✅ Platform-specific optimizations
- ✅ Custom commands and shortcuts
- ✅ Faster skill loading

### One-Command Conversion

```bash
# Run conversion script
./scripts/convert-to-rules.sh
```

**Output**:
```
📝 Creating .cursorrules...
✅ Created .cursorrules

📝 Creating .windsurfrules...
✅ Created .windsurfrules

📝 Creating .clinerules...
✅ Created .clinerules

📝 Creating .continuerc.json...
✅ Created .continuerc.json

📝 Creating AIDER_USAGE.md...
✅ Created AIDER_USAGE.md

✅ Conversion complete!
```

### What Each File Does

#### `.cursorrules`
**For**: Cursor IDE
**Purpose**: Rules file that Cursor reads on startup
**Contains**:
- Agent instructions
- Skill loading directives
- @ mention references for skills
- Workflow guidelines

**Auto-detected**: ✅ Yes (restart IDE after creation)

**Example content**:
```markdown
# n8n Automation Expert Rules

Load skills from `.agent/skills/n8n-automation/`:
- n8n-template-search: @.agent/skills/.../SKILL.md
- n8n-workflow-patterns: @.agent/skills/.../SKILL.md
...
```

---

#### `.windsurfrules`
**For**: Windsurf (Codeium IDE)
**Purpose**: Rules file for Windsurf's agent system
**Contains**:
- Agent behavior guidelines
- Skill directory structure
- Reference paths for skills
- Core workflow process

**Auto-detected**: ✅ Yes (restart IDE after creation)

**Example content**:
```markdown
# n8n Automation Expert Rules for Windsurf

Skills Directory Structure:
.agent/skills/n8n-automation/
├── n8n-template-search/
├── n8n-workflow-patterns/
...
```

---

#### `.clinerules`
**For**: Cline (VSCode Extension)
**Purpose**: Configuration hints for Cline
**Contains**:
- Agent profile
- Skills location
- Loading instructions
- Key usage rules

**Auto-detected**: ⚠️ Requires manual configuration in Cline settings

**Example content**:
```markdown
# n8n Automation Expert - Cline Configuration

## Skills Location
All skills are in: `.agent/skills/n8n-automation/`

To load: read the corresponding SKILL.md file
```

---

#### `.continuerc.json`
**For**: Continue.dev (VSCode Extension)
**Purpose**: JSON configuration for Continue
**Contains**:
- Context providers (links to `.agent/`)
- Custom commands (`/n8n-template-search`, `/n8n-build`, `/n8n-debug`)
- Skill paths

**Auto-detected**: ✅ Yes (reload VSCode after creation)

**Example content**:
```json
{
  "name": "n8n Automation Expert",
  "contextProviders": [
    {"name": "n8n-agent", "params": {"path": ".agent/agents/..."}}
  ],
  "customCommands": [
    {"name": "n8n-template-search", "prompt": "Load skill and search..."}
  ]
}
```

---

#### `AIDER_USAGE.md`
**For**: Aider (CLI tool)
**Purpose**: Instructions document
**Contains**:
- Command-line examples
- File loading patterns
- Common workflows
- Tips and tricks

**Auto-detected**: ❌ No (manual reference)

**Example content**:
```markdown
# Using n8n Skills with Aider

## Loading the Agent
aider --read .agent/agents/n8n-automation-expert.md

## Common Commands
# Template search
aider --read .agent/skills/.../n8n-template-search/SKILL.md
```

---

### Conversion Process Details

The script:
1. **Reads** `.agent/agents/n8n-automation-expert.md` (main agent)
2. **Extracts** key instructions and skill references
3. **Adapts** content to each platform's format:
   - Cursor: Markdown rules with @ mentions
   - Windsurf: Markdown rules with directory structure
   - Cline: Simplified configuration hints
   - Continue.dev: JSON with context providers and commands
   - Aider: CLI usage instructions
4. **Writes** platform-specific files
5. **Preserves** original `.agent/` folder (no changes)

### Manual Conversion (Advanced)

If you need to customize:

```bash
# View the script source
cat scripts/convert-to-rules.sh

# Run with debugging
bash -x scripts/convert-to-rules.sh

# Create single file manually
# Example: Only create .cursorrules
cat > .cursorrules << 'EOF'
# Your custom rules here
# Reference: .agent/agents/n8n-automation-expert.md
EOF
```

### After Conversion

**Restart/Reload Required**:
- Cursor: Restart IDE or reload window
- Windsurf: Restart IDE
- Cline: Reload VSCode window
- Continue.dev: Reload VSCode window
- Aider: No restart needed (reference file when starting)

**Verification**:
```bash
# Check files were created
ls -la | grep -E '\.(cursorrules|windsurfrules|clinerules)'
ls -la .continuerc.json AIDER_USAGE.md

# Check file contents
cat .cursorrules    # Should show agent rules
cat .continuerc.json  # Should show JSON config
```

---

## 📋 Feature Comparison

### What Works Where

| Feature | Claude | Windsurf | Cursor | Cline | Continue | Aider |
|---------|--------|----------|--------|-------|----------|-------|
| Auto skill detection | ✅ | ✅ | ✅ | ⚠️ | ⚠️ | ❌ |
| MCP tools | ✅ | 🟡 | 🟡 | 🟡 | 🟡 | ❌ |
| Template search (MCP) | ✅ | 🟡 | 🟡 | 🟡 | 🟡 | ❌ |
| Template search (Web) | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ |
| Workflow validation | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Expression syntax help | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Code node assistance | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Dynamic skill loading | ✅ | ✅ | ✅ | ⚠️ | ⚠️ | ❌ |

✅ = Full support | 🟡 = Partial/Community | ⚠️ = Manual | ❌ = Not available

---

## 💡 Best Practices by Tool

### Claude Code
```
✅ Just ask naturally - skills auto-load
✅ Use MCP tools freely
✅ Template search works instantly
```

### Windsurf/Cursor
```
✅ Use @ mentions to reference skills
✅ Let rules file guide behavior
⚠️ MCP may need manual WebFetch fallback
```

### Cline/Continue
```
⚠️ Explicitly mention skill files when needed
⚠️ Use custom commands (Continue.dev)
⚠️ Check MCP plugin status
```

### Aider
```
⚠️ Always use --read flags
⚠️ Load specific skill for task
❌ No MCP - use manual approaches
```

---

## 🆘 Troubleshooting

### "Skills not loading"

**Claude Code**: Skills should auto-load. Check `.agent/` folder exists.

**Cursor/Windsurf**:
1. Ensure `.cursorrules` or `.windsurfrules` exists
2. Reload window
3. Try @ mention: `@.agent/agents/n8n-automation-expert.md`

**Cline/Continue**:
1. Check configuration file exists
2. Reload VSCode
3. Manually reference file path

### "MCP tools not working"

**Check**:
1. MCP server installed: `npx @leonardsellem/n8n-mcp-server --version`
2. Configuration file correct (see MCP Setup)
3. n8n instance running (if using API tools)

**Fallback**: Use WebFetch manually for template search
```javascript
WebFetch({
  url: "https://n8n.io/workflows/?search=webhook",
  prompt: "Find webhook templates"
})
```

### "Template search failing"

**With MCP**: Check n8n-mcp server status

**Without MCP**: Use web fallback
- Load `n8n-template-search` skill
- Skill will use WebFetch automatically
- Works without MCP configuration

---

## 💡 Practical Examples by Platform

### Claude Code Examples

```bash
# No setup needed after init
npx ag-n8n-skills init

# Just ask naturally:
> "Find n8n templates for webhook processing"
# Agent loads n8n-template-search skill automatically

> "Create a workflow that sends Slack notifications"
# Agent searches templates → builds workflow → validates

> "Debug this n8n expression: {{$json.body.email}}"
# Agent loads n8n-expression-syntax skill automatically
```

---

### Cursor Examples

```bash
# After conversion
./scripts/convert-to-rules.sh

# Method 1: Natural language (rules file guides AI)
> "Create webhook to Slack workflow"

# Method 2: @ mention specific skills
> "Help me search templates @.agent/skills/n8n-automation/n8n-template-search/SKILL.md"

# Method 3: @ mention agent
> "@.agent/agents/n8n-automation-expert.md build a scheduled workflow"

# Check rules loaded
# Look at Cursor settings → Rules → should show .cursorrules active
```

---

### Windsurf Examples

```bash
# After conversion
./scripts/convert-to-rules.sh

# Ask naturally (reads .windsurfrules)
> "Create an n8n workflow for daily reports"

# Reference specific skills
> "Load n8n-workflow-patterns skill and show me scheduled task pattern"

# Debug with specific skill
> "Use n8n-validation-expert to debug this error: [paste error]"
```

---

### Cline Examples

```bash
# After conversion
./scripts/convert-to-rules.sh

# Explicitly mention files
> "Read .agent/agents/n8n-automation-expert.md and help me create webhook workflow"

# Load specific skill
> "Read .agent/skills/n8n-automation/n8n-template-search/SKILL.md and find Slack templates"

# Multiple skills
> "Read these files:
   - .agent/agents/n8n-automation-expert.md
   - .agent/skills/n8n-automation/n8n-workflow-patterns/SKILL.md
   Then design a webhook processing workflow"
```

---

### Continue.dev Examples

```bash
# After conversion and VSCode reload
./scripts/convert-to-rules.sh
# Reload VSCode window

# Use custom commands (from .continuerc.json)
> /n8n-template-search webhook slack
> /n8n-build "scheduled task that emails reports"
> /n8n-debug "validation error: missing required field"

# Or use naturally (context providers active)
> "Create n8n workflow for webhook processing"
# Continue.dev loads agent context automatically
```

---

### Aider Examples

```bash
# See AIDER_USAGE.md for all commands
cat AIDER_USAGE.md

# Template search workflow
aider --read .agent/skills/n8n-automation/n8n-template-search/SKILL.md
> "Find templates for Stripe payment processing"

# Build workflow with agent
aider --read .agent/agents/n8n-automation-expert.md
> "Create a workflow: webhook → validate → Slack notification"

# Load multiple skills for complex task
aider \
  --read .agent/agents/n8n-automation-expert.md \
  --read .agent/skills/n8n-automation/n8n-workflow-patterns/SKILL.md \
  --read .agent/skills/n8n-automation/n8n-validation-expert/SKILL.md
> "Design and validate a complex AI agent workflow"
```

---

## 🎯 Recommendations

### For New Users
1. **Start with Claude Code** - Best experience, zero setup
2. **Try Cursor or Windsurf** - Excellent alternatives with minimal setup
3. **Explore Continue/Cline** - Good VSCode integration

### For Teams
- **Primary**: Claude Code (consistent experience, zero config)
- **Alternative**: Cursor (excellent IDE, good rules support)
- **Backup**: Continue.dev (flexible, highly customizable)

### For Advanced Users
- **Aider**: Great for CLI-first workflows (requires manual setup)
- **Custom Tools**: Skills are just Markdown - easy to adapt
- **Mixed Environment**: Use `.agent/` + rules files for multi-tool support

### For Existing Projects
```bash
# Add to existing project with any AI assistant
cd your-project
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# Now everyone on team can use their preferred AI tool!
```

---

## 📚 Additional Resources

- **Main Documentation**: [README.md](README.md)
- **Agent Documentation**: [.agent/agents/n8n-automation-expert.md](.agent/agents/n8n-automation-expert.md)
- **Skills Overview**: [.agent/skills/n8n-automation/SKILL.md](.agent/skills/n8n-automation/SKILL.md)
- **Template Search**: [.agent/skills/n8n-automation/n8n-template-search/README.md](.agent/skills/n8n-automation/n8n-template-search/README.md)
- **Aider Instructions**: [AIDER_USAGE.md](AIDER_USAGE.md)
- **Changelog**: [CHANGELOG.md](CHANGELOG.md)

---

## 🤝 Contributing

Found a way to make it work with another AI assistant? Please contribute!

1. Test the integration
2. Document the setup process
3. Submit a PR with updates to this file

---

**Questions?** Open an issue: [github.com/julioborges/ag-n8n-skills/issues](https://github.com/julioborges/ag-n8n-skills/issues)
