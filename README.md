<div align="center">

# ⚡ n8n Antigravity Skills

### AI Agent & Skills for production-ready n8n workflow automation

[![npm version](https://img.shields.io/npm/v/ag-n8n-skills.svg?style=flat-square&color=CB3837)](https://www.npmjs.com/package/ag-n8n-skills)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![n8n](https://img.shields.io/badge/n8n-workflow_automation-FF6D5A?style=flat-square&logo=n8n&logoColor=white)](https://n8n.io/)
[![Multi-Platform](https://img.shields.io/badge/Platform-Multi_AI_Support-6366F1?style=flat-square)](COMPATIBILITY.md)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Native-10A37F?style=flat-square)](https://claude.ai/code)
[![Cursor](https://img.shields.io/badge/Cursor-Supported-4A9EFF?style=flat-square)](https://cursor.sh)
[![Windsurf](https://img.shields.io/badge/Windsurf-Supported-00D4FF?style=flat-square)](https://codeium.com/windsurf)

<br />

<p align="center">
  <strong>🤖 Expert n8n workflow architect</strong> that builds production-ready automations using MCP tools.
  <br />
  Create, validate, debug, and deploy n8n workflows with AI assistance.
</p>

<br />

</div>

---

## ⚡ Quick Install

> **👉 New to this?** See [QUICK_START.md](QUICK_START.md) for step-by-step instructions by platform

### Universal Installation (All Platforms)

```bash
# Install to your project
npx ag-n8n-skills init
```

**That's it for Antigravity or Claude Code!** Just start using it. ✨

### For Other AI Assistants (Cursor, Windsurf, Cline, etc.)

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Convert to your platform's format
chmod +x scripts/convert-to-rules.sh
./scripts/convert-to-rules.sh
```

**This creates** `.cursorrules`, `.windsurfrules`, `.clinerules`, `.continuerc.json`, and more!

### 📖 Platform-Specific Guides

| Platform | Guide | Time |
|----------|-------|------|
| **Claude Code** | [Quick Start](QUICK_START.md#-claude-code-recommended) | 30s |
| **Windsurf** | [Quick Start](QUICK_START.md#-windsurf) | 2m |
| **Cursor** | [Quick Start](QUICK_START.md#-cursor) | 2m |
| **Cline** | [Quick Start](QUICK_START.md#-cline-vscode) | 5m |
| **Continue.dev** | [Quick Start](QUICK_START.md#-continuedev-vscode) | 3m |
| **Aider** | [Quick Start](QUICK_START.md#%EF%B8%8F-aider-cli) | 5m |
| **All Platforms** | [Compatibility Guide](COMPATIBILITY.md) | - |

### What Gets Installed

```
.agent/
├── agents/
│   └── n8n-automation-expert.md    # 🤖 Expert Agent
└── skills/
    └── n8n-automation/             # 🛠️ 8 Specialized Skills
        ├── n8n-template-search/    # 🆕 NEW: Multi-source template discovery
        ├── n8n-mcp-tools-expert/   # MCP tools usage
        ├── n8n-workflow-patterns/  # Workflow architecture
        ├── n8n-expression-syntax/  # Expression syntax
        ├── n8n-validation-expert/  # Error handling
        ├── n8n-node-configuration/ # Node configuration
        ├── n8n-code-javascript/    # JavaScript code
        └── n8n-code-python/        # Python code

# After conversion (optional):
.cursorrules                         # ← Cursor auto-detects this
.windsurfrules                       # ← Windsurf auto-detects this
.clinerules                          # ← Cline configuration
.continuerc.json                     # ← Continue.dev configuration
AIDER_USAGE.md                       # ← Aider instructions
```

---

## 🎯 Platform-Specific Quick Start

### 💎 Claude Code (Zero Config)

```bash
npx ag-n8n-skills init
# Done! Just ask: "Create an n8n workflow for webhook processing"
```

### 🌊 Windsurf / Cursor

```bash
npx ag-n8n-skills init
./scripts/convert-to-rules.sh
# Restart IDE, then use @ mentions or just ask naturally
```

### 📦 Cline / Continue.dev (VSCode)

```bash
npx ag-n8n-skills init
./scripts/convert-to-rules.sh
# Reload VSCode window (Cmd/Ctrl+Shift+P → "Reload Window")
```

### ⚙️ Aider (CLI)

```bash
npx ag-n8n-skills init
./scripts/convert-to-rules.sh
# See AIDER_USAGE.md for commands
```

---

## 🤖 What's Included

### Expert Agent

| Agent | Description |
|-------|-------------|
| **n8n-automation-expert** | Expert n8n workflow architect with 8+ years experience. Masters n8n JSON syntax, all versions (0.x to 1.x), native nodes, LLM integrations, and troubleshooting. |

### Skills (8 Total)

| Skill | Purpose |
|-------|---------|
| **n8n-automation** | 🎯 Master skill orchestrating all 8 sub-skills |
| **🆕 n8n-template-search** | Template discovery from MCP library, n8n.io, GitHub, forum |
| **n8n-mcp-tools-expert** | MCP tool usage for n8n operations |
| **n8n-workflow-patterns** | Architectural patterns for workflows |
| **n8n-expression-syntax** | Expression syntax (`$json`, `$node`) |
| **n8n-validation-expert** | Error handling and debugging |
| **n8n-node-configuration** | Complex node configuration |
| **n8n-code-javascript** | JavaScript code nodes |
| **n8n-code-python** | Python code nodes |

---

## 🚀 Usage

### Automatic Detection

The AI automatically detects and applies the n8n expert when you mention:

```
You: "Create a webhook that sends Slack notifications"
AI: 🤖 Using @n8n-automation-expert...

You: "Debug my n8n workflow"
AI: 🤖 Applying n8n debugging skills...
```

### What You Can Build

- ✅ Webhook → Process → Respond workflows
- ✅ Scheduled automations (daily reports, syncs)
- ✅ AI agents with LangChain nodes
- ✅ Multi-service integrations (Slack, Gmail, Sheets)
- ✅ Error handling with retry patterns
- ✅ Complex conditional routing

### Example Requests

```
"Create a workflow that triggers on webhook and sends data to Slack"

"Build a daily scheduled workflow that fetches API data and emails a report"

"Design an AI agent workflow using OpenAI for customer support"

"Debug why my n8n HTTP Request node returns 401"
```

---

## 🛠️ CLI Commands

```bash
# Install .agent folder
ag-n8n-skills init

# Update to latest version  
ag-n8n-skills update

# Check installation status
ag-n8n-skills status
```

### Options

```bash
ag-n8n-skills init --force      # Overwrite existing .agent folder
ag-n8n-skills init --path ./app # Install in specific directory
ag-n8n-skills init --quiet      # Suppress output (for CI/CD)
ag-n8n-skills init --dry-run    # Preview actions without executing
```

---

## 📋 Requirements

- **Node.js** >= 16.0.0
- **AI Coding Assistant**: Claude Code, Windsurf, Cursor, Cline, Continue.dev, or Aider
  - 💡 **Full compatibility guide**: See [COMPATIBILITY.md](COMPATIBILITY.md)
- **n8n instance** (optional, for deployment)

### MCP Tools Integration

For full functionality, configure the [n8n-mcp-server](https://github.com/your-n8n-mcp-server):

```json
{
  "n8n-mcp": {
    "command": "npx",
    "args": ["-y", "@leonardsellem/n8n-mcp-server"],
    "env": {
      "N8N_API_URL": "http://localhost:5678/api/v1",
      "N8N_API_KEY": "your-api-key"
    }
  }
}
```

---

## 💡 Features

| Feature | Description |
|---------|-------------|
| 🔍 **Template Discovery** | Searches 2,709+ MCP templates + n8n.io + GitHub before building |
| 🆕 **Multi-Source Search** | Discovers templates from MCP library, n8n.io, GitHub repositories, and community forums |
| 🤖 **Intelligent Agent** | Enhanced with skill usage directives for better decision-making |
| ✅ **Validation** | Validates workflows at every step |
| 🔄 **MCP Integration** | Uses MCP tools for node discovery and configuration |
| 🛡️ **Error Handling** | Implements proper error handling patterns |
| 📝 **Documentation** | Adds Sticky Notes to explain complex logic |
| ⚡ **Production Ready** | Builds workflows that work flawlessly |

---

## 🌍 Multi-Platform Support

### Compatible AI Assistants

| Assistant | Support | Native Format | Converted Format | Setup Time |
|-----------|---------|---------------|------------------|------------|
| **Antigravity** ⭐ | ✅ Native | `.agent/` | - | 🟢 0 min |
| **Claude Code** | ✅ Native | `.agent/` | - | 🟢 0 min |
| **Claude Desktop** | ✅ Native | `.agent/` | - | 🟢 0 min |
| **Windsurf** | ✅ Excellent | `.agent/` | `.windsurfrules` | 🟢 1 min |
| **Cursor** | ✅ Excellent | `.agent/` | `.cursorrules` | 🟢 1 min |
| **Cline (VSCode)** | 🟡 Good | - | `.clinerules` | 🟡 2 min |
| **Continue.dev** | 🟡 Good | - | `.continuerc.json` | 🟡 2 min |
| **Aider** | 🟡 Manual | - | `AIDER_USAGE.md` | 🟠 5 min |

⭐ = Recommended | ✅ = Full Support | 🟡 = Good Support

---

## 🔄 Converting to Rules Format

### Why Convert?

The **native `.agent/` format** works best with Antigravity and Claude Code/Desktop. For other AI assistants, we convert it to their preferred format:

- **Cursor** → `.cursorrules` (auto-detected)
- **Windsurf** → `.windsurfrules` (auto-detected)
- **Cline** → `.clinerules` (manual config)
- **Continue.dev** → `.continuerc.json` (auto-detected)
- **Aider** → `AIDER_USAGE.md` (instructions)

### Automatic Conversion (One Command)

```bash
# After installing skills
./scripts/convert-to-rules.sh
```

**This creates 5 files automatically:**

```
✅ .cursorrules          → Cursor rules file
✅ .windsurfrules        → Windsurf rules file
✅ .clinerules           → Cline configuration
✅ .continuerc.json      → Continue.dev config
✅ AIDER_USAGE.md        → Aider instructions
```

### What Happens During Conversion?

The script:
1. ✅ Reads `.agent/` structure
2. ✅ Extracts agent instructions and skill references
3. ✅ Converts to each platform's format
4. ✅ Creates platform-specific files
5. ✅ Preserves all functionality

**No data loss** - `.agent/` folder remains unchanged!

### Manual Conversion (Optional)

If you prefer to customize:

```bash
# View the script first
cat scripts/convert-to-rules.sh

# Run with verbose output
bash -x scripts/convert-to-rules.sh

# Or create individual files manually
# See COMPATIBILITY.md for templates
```

---

## 📱 Platform-Specific Usage

### Using with Claude Code

```bash
# Install
npx ag-n8n-skills init

# Use naturally
"Create an n8n workflow that sends Slack notifications on webhook"
```

**Features**: ✅ Auto-detection | ✅ MCP tools | ✅ Template search | ✅ All skills

---

### Using with Cursor

```bash
# 1. Install and convert
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# 2. Restart Cursor

# 3. Use with @ mentions or naturally
"Create webhook workflow @n8n-automation-expert"
# Or just: "Create webhook workflow for Slack"
```

**Features**: ✅ Auto-detection | 🟡 MCP (community) | ✅ Template search (web) | ✅ All skills

**Tip**: `.cursorrules` is auto-detected. You can also reference skills directly:
```
@.agent/skills/n8n-automation/n8n-template-search/SKILL.md
```

---

### Using with Windsurf

```bash
# 1. Install and convert
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# 2. Restart Windsurf

# 3. Use naturally or with @ mentions
"Build n8n workflow for webhook processing"
```

**Features**: ✅ Auto-detection | 🟡 MCP (community) | ✅ Template search (web) | ✅ All skills

**Tip**: Windsurf reads `.windsurfrules` automatically and understands skill references.

---

### Using with Cline (VSCode)

```bash
# 1. Install and convert
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# 2. Configure Cline to read .clinerules
# (Check Cline docs for current config method)

# 3. Reload VSCode window
# Cmd/Ctrl+Shift+P → "Reload Window"

# 4. Explicitly mention files when needed
"Read .agent/agents/n8n-automation-expert.md and create webhook workflow"
```

**Features**: 🟡 Manual loading | 🟡 MCP (config) | ✅ Template search (web) | ✅ All skills

---

### Using with Continue.dev (VSCode)

```bash
# 1. Install and convert
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# 2. Reload VSCode
# Continue.dev auto-reads .continuerc.json

# 3. Use custom commands
/n8n-template-search "webhook processing"
/n8n-build "webhook to Slack"
/n8n-debug "validation error"
```

**Features**: ✅ Context providers | 🟡 MCP (plugin) | ✅ Template search (web) | ✅ All skills

**Custom Commands**:
- `/n8n-template-search` - Search for templates
- `/n8n-build` - Build workflows with agent
- `/n8n-debug` - Debug with validation expert

---

### Using with Aider (CLI)

```bash
# 1. Install and convert
npx ag-n8n-skills init
./scripts/convert-to-rules.sh

# 2. Read AIDER_USAGE.md for commands

# 3. Load agent manually
aider --read .agent/agents/n8n-automation-expert.md

# Or load specific skill
aider --read .agent/skills/n8n-automation/n8n-template-search/SKILL.md
```

**Features**: 🟡 Manual loading | ❌ No MCP | ✅ Template search (web) | ✅ All skills

**Common workflows**:
```bash
# Template search
aider --read .agent/skills/n8n-automation/n8n-template-search/SKILL.md
# Then: "Find webhook templates"

# Build workflow
aider --read .agent/agents/n8n-automation-expert.md
# Then: "Create Slack notification workflow"

# Multiple skills
aider \
  --read .agent/agents/n8n-automation-expert.md \
  --read .agent/skills/n8n-automation/n8n-workflow-patterns/SKILL.md
```

---

## 🔍 Verification After Installation

### Check Installation

```bash
# Verify .agent/ folder exists
ls -la .agent/

# Should show:
# .agent/agents/n8n-automation-expert.md
# .agent/skills/n8n-automation/...
```

### Check Conversion

```bash
# After running convert script
ls -la | grep -E '\.(cursorrules|windsurfrules|clinerules|continuerc)'

# Should show (if conversion ran):
# .cursorrules
# .windsurfrules
# .clinerules
# .continuerc.json
```

### Test Usage

**Claude Code**:
```bash
# Just ask in chat
"Help me create an n8n workflow"
```

**Cursor/Windsurf**:
```bash
# Check rules loaded
# Look for confirmation in status bar or settings
# Then ask: "Create n8n workflow"
```

**Cline/Continue**:
```bash
# Check VSCode output panel for config messages
# Try custom commands (Continue) or file references (Cline)
```

📖 **Full compatibility guide**: [COMPATIBILITY.md](COMPATIBILITY.md)

### 🔄 Understanding Rules Conversion

**What is it?** Converting `.agent/` format to platform-specific files (`.cursorrules`, `.windsurfrules`, etc.)

**Why?** Better auto-detection and platform-specific optimizations

**How?** One command: `./scripts/convert-to-rules.sh`

📖 **Detailed conversion guide**: [CONVERSION_GUIDE.md](CONVERSION_GUIDE.md)

---

## 🆕 What's New: Template Search Skill

### Comprehensive Template Discovery

The new **n8n-template-search** skill provides intelligent template discovery from multiple sources:

**Sources**:
- 🔥 **MCP Template Library** (2,709+ curated templates) - Fast & reliable
- 🌐 **n8n.io/workflows** - Latest community templates
- 💻 **GitHub** - Code examples and patterns
- 💬 **Community Forum** - Real-world use cases

**Search Capabilities**:
```javascript
// Search by keyword
search_templates({query: "webhook slack notification"})

// Search by specific nodes
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.webhook", "n8n-nodes-base.slack"]
})

// Search by workflow pattern
search_templates({searchMode: "by_task", task: "webhook_processing"})

// Web search for recent templates
WebFetch({
  url: "https://n8n.io/workflows/?search=topic",
  prompt: "Find templates with descriptions"
})
```

**Benefits**:
- ✅ Always find the best template before building from scratch
- ✅ Discover recent community patterns and best practices
- ✅ Learn from real-world workflow implementations
- ✅ Reduce development time with proven templates

**Learn more**: See [n8n-template-search documentation](./.agent/skills/n8n-automation/n8n-template-search/README.md)

---

## 🔄 How Rules Conversion Works

### The Universal Format

All skills are stored in **universal `.agent/` format** (Markdown):

```
.agent/
├── agents/
│   └── n8n-automation-expert.md    ← Agent instructions
└── skills/
    └── n8n-automation/             ← 8 specialized skills
        ├── SKILL.md
        └── [sub-skills]/
```

**Why Markdown?**
- ✅ Human-readable
- ✅ Version control friendly
- ✅ Works with any AI that reads text
- ✅ Easy to customize

### Automatic Conversion Flow

```
Step 1: Install                Step 2: Convert               Step 3: Use
┌─────────────────┐           ┌─────────────────┐          ┌─────────────────┐
│ npx ag-n8n-     │           │ ./scripts/      │          │ Restart IDE     │
│ skills init     │    →      │ convert-to-     │    →     │                 │
│                 │           │ rules.sh        │          │ Start coding!   │
└─────────────────┘           └─────────────────┘          └─────────────────┘
        ↓                              ↓                            ↓
   .agent/ folder              Platform files              AI uses your
   created                     created                     preferred format
```

### What Gets Created

```bash
# Original (stays unchanged)
.agent/
├── agents/n8n-automation-expert.md
└── skills/n8n-automation/...

# After conversion (new files)
.cursorrules              ← Cursor
.windsurfrules           ← Windsurf
.clinerules              ← Cline
.continuerc.json         ← Continue.dev
AIDER_USAGE.md           ← Aider
```

### Format Comparison

| Format | Size | Platform | Auto-detect | Customizable |
|--------|------|----------|-------------|--------------|
| `.agent/` | ~2,500 lines | Claude, Windsurf, Cursor | ✅ | ✅✅✅ |
| `.cursorrules` | ~80 lines | Cursor | ✅ | ✅✅ |
| `.windsurfrules` | ~70 lines | Windsurf | ✅ | ✅✅ |
| `.clinerules` | ~40 lines | Cline | ⚠️ | ✅ |
| `.continuerc.json` | ~30 lines | Continue.dev | ✅ | ✅✅✅ |
| `AIDER_USAGE.md` | ~100 lines | Aider | ❌ | ✅ |

**Key Point**: Rules files are **summaries** that reference the full `.agent/` folder. They don't duplicate content—they tell the AI where to find it.

### Conversion Script Details

```bash
# What the script does:
./scripts/convert-to-rules.sh

1. ✅ Reads .agent/agents/n8n-automation-expert.md
2. ✅ Extracts key instructions and skill paths
3. ✅ Generates platform-specific format:
   - Cursor: Markdown rules with @ references
   - Windsurf: Markdown with directory structure
   - Cline: Configuration hints
   - Continue.dev: JSON with custom commands
   - Aider: CLI usage instructions
4. ✅ Writes files (doesn't modify .agent/)
5. ✅ Shows success message
```

### When to Re-run Conversion

Re-run the script when:
- ✅ You update `.agent/` content
- ✅ You switch to a new AI assistant
- ✅ Rules file gets deleted or corrupted
- ✅ You want to reset to defaults

```bash
# Safe to run multiple times
./scripts/convert-to-rules.sh
# Overwrites existing files with fresh versions
```

---

## 🚦 Quick Start Decision Tree

```
Which AI assistant are you using?

├─ Claude Code / Claude Desktop
│  └─ npx ag-n8n-skills init
│     ✅ Done! No conversion needed
│
├─ Cursor / Windsurf
│  └─ npx ag-n8n-skills init
│     └─ ./scripts/convert-to-rules.sh
│        └─ Restart IDE
│           ✅ Done!
│
├─ Cline / Continue.dev (VSCode)
│  └─ npx ag-n8n-skills init
│     └─ ./scripts/convert-to-rules.sh
│        └─ Reload VSCode window
│           ✅ Done!
│
└─ Aider (CLI)
   └─ npx ag-n8n-skills init
      └─ ./scripts/convert-to-rules.sh
         └─ Read AIDER_USAGE.md
            └─ Use --read flags
               ✅ Done!
```

---

## 📚 Documentation Index

### Getting Started
- 🚀 **[Quick Start](QUICK_START.md)** - Choose your platform and get started in minutes
- 📖 **[README](README.md)** - This file, overview and main documentation
- 🔄 **[Conversion Guide](CONVERSION_GUIDE.md)** - Detailed guide to rules conversion

### Platform Support
- 🌍 **[Compatibility Guide](COMPATIBILITY.md)** - Complete multi-platform support guide
- 💻 **Platform-Specific Setup**:
  - [Claude Code](QUICK_START.md#-claude-code-recommended) (30 seconds)
  - [Windsurf](QUICK_START.md#-windsurf) (2 minutes)
  - [Cursor](QUICK_START.md#-cursor) (2 minutes)
  - [Cline](QUICK_START.md#-cline-vscode) (5 minutes)
  - [Continue.dev](QUICK_START.md#-continuedev-vscode) (3 minutes)
  - [Aider](QUICK_START.md#%EF%B8%8F-aider-cli) (5 minutes)

### Skills Documentation
- 🎯 **[Master Skill](.agent/skills/n8n-automation/SKILL.md)** - Overview of all 8 skills
- 🆕 **[Template Search](.agent/skills/n8n-automation/n8n-template-search/README.md)** - Multi-source template discovery
- 🤖 **[Agent](.agent/agents/n8n-automation-expert.md)** - Expert agent documentation
- 🛠️ **Individual Skills**:
  - [MCP Tools Expert](.agent/skills/n8n-automation/n8n-mcp-tools-expert/SKILL.md)
  - [Workflow Patterns](.agent/skills/n8n-automation/n8n-workflow-patterns/SKILL.md)
  - [Expression Syntax](.agent/skills/n8n-automation/n8n-expression-syntax/SKILL.md)
  - [Validation Expert](.agent/skills/n8n-automation/n8n-validation-expert/SKILL.md)
  - [Node Configuration](.agent/skills/n8n-automation/n8n-node-configuration/SKILL.md)
  - [JavaScript Code](.agent/skills/n8n-automation/n8n-code-javascript/SKILL.md)
  - [Python Code](.agent/skills/n8n-automation/n8n-code-python/SKILL.md)

### Project Information
- 📝 **[Changelog](CHANGELOG.md)** - Version history and updates
- 📄 **[License](LICENSE)** - MIT License

### Quick Links
| Document | Purpose | Time to Read |
|----------|---------|--------------|
| [QUICK_START.md](QUICK_START.md) | Get started with your platform | 2 min |
| [COMPATIBILITY.md](COMPATIBILITY.md) | Understand platform support | 10 min |
| [CONVERSION_GUIDE.md](CONVERSION_GUIDE.md) | Learn about rules conversion | 5 min |
| [Template Search Skill](.agent/skills/n8n-automation/n8n-template-search/README.md) | Template discovery guide | 5 min |

---

## ☕ Pague um Cafezinho

Se este projeto te ajudou, considere fazer uma contribuição via **Pix**:

<div align="center">

<img src="https://res.cloudinary.com/dhmzgoe1d/image/upload/qr-code-pix_txx0hu.jpg" alt="QR Code Pix" width="200" />

<br />
<br />

*Escaneie o QR code acima para contribuir* 🙏

</div>

---

## Credits
Based on concept for Romuald Członkowski - [www.aiadvisors.pl/en](https://www.aiadvisors.pl/en)
- [n8n-mcp](https://github.com/czlonkowski/n8n-mcp)
- [n8n-skills](https://github.com/czlonkowski/n8n-skills)

Adapted by Julio Borges - [www.julioborges.net.br](https://julioborges.net.br)

---

## 📄 License

MIT © [Julio Borges](https://github.com/julioborges)

---

<div align="center">

**Made with ❤️ for the n8n community**

[⭐ Star this repo](https://github.com/julioborges/ag-n8n-skills) · [🐛 Report Bug](https://github.com/julioborges/ag-n8n-skills/issues) · [💡 Request Feature](https://github.com/julioborges/ag-n8n-skills/issues)

</div>