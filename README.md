<div align="center">

# ⚡ n8n Antigravity Skills

### AI Agent & Skills for production-ready n8n workflow automation

[![npm version](https://img.shields.io/npm/v/ag-n8n-skills.svg?style=flat-square&color=CB3837)](https://www.npmjs.com/package/ag-n8n-skills)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![n8n](https://img.shields.io/badge/n8n-workflow_automation-FF6D5A?style=flat-square&logo=n8n&logoColor=white)](https://n8n.io/)
[![Antigravity](https://img.shields.io/badge/Antigravity-IDE-6366F1?style=flat-square)](https://github.com/google/anthropic)

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

```bash
npx ag-n8n-skills init
```

Or install globally:

```bash
npm install -g ag-n8n-skills
ag-n8n-skills init
```

This installs the `.agent` folder containing the expert agent and all skills into your project.

```
.agent/
├── .agents/
│   └── n8n-automation-expert.md    # 🤖 Expert Agent
└── .skills/
    └── n8n-automation/             # 🛠️ 8 Specialized Skills
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
| **n8n-automation** | 🎯 Master skill orchestrating all 7 sub-skills |
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
- **Antigravity IDE** or compatible AI coding assistant
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
| 🔍 **Template Discovery** | Searches 2,709+ templates before building from scratch |
| ✅ **Validation** | Validates workflows at every step |
| 🔄 **MCP Integration** | Uses MCP tools for node discovery and configuration |
| 🛡️ **Error Handling** | Implements proper error handling patterns |
| 📝 **Documentation** | Adds Sticky Notes to explain complex logic |
| ⚡ **Production Ready** | Builds workflows that work flawlessly |

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

[⭐ Star this repo](https://github.com/julioborges/n8n-antigravity-skills) · [🐛 Report Bug](https://github.com/julioborges/n8n-antigravity-skills/issues) · [💡 Request Feature](https://github.com/julioborges/n8n-antigravity-skills/issues)

</div>