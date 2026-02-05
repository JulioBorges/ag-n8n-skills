# Quick Start Guide - Multi-Platform

> **Choose your AI assistant below for instant setup instructions**

---

## 🎯 Choose Your Platform

<details open>
<summary><strong>🚀 Antigravity (Recommended)</strong> - Native Support ⭐</summary>

### Installation

```bash
npx ag-n8n-skills init
```

### That's it! ✅

Antigravity natively understands the `.agent` structure. Just start using:

```
You: "Create an n8n workflow for webhook processing"
Antigravity: [Automatically loads agent and creates workflow]
```

**Time to start**: 30 seconds

</details>

---

<details>
<summary><strong>💎 Claude Code</strong> - Zero Configuration</summary>

### Installation

```bash
npx ag-n8n-skills init
```

### That's it! ✅

No conversion needed. Just start using:

```
You: "Create an n8n workflow for webhook processing"
Claude: [Automatically loads agent and creates workflow]
```

**Time to start**: 30 seconds

</details>

---

<details>
<summary><strong>🌊 Windsurf</strong> - Excellent Support</summary>

### Installation

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Convert to Windsurf format
./scripts/convert-to-rules.sh

# 3. Restart Windsurf
```

### Usage

```
You: "Create webhook workflow for Slack"
Windsurf: [Reads .windsurfrules and creates workflow]
```

Or use @ mentions:
```
You: "@.agent/.agents/n8n-automation-expert.md help me build this"
```

**Time to start**: 2 minutes

</details>

---

<details>
<summary><strong>⚡ Cursor</strong> - Excellent Support</summary>

### Installation

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Convert to Cursor format
./scripts/convert-to-rules.sh

# 3. Restart Cursor or reload window
# Cmd/Ctrl+Shift+P → "Reload Window"
```

### Usage

```
You: "Build n8n workflow for webhook processing"
Cursor: [Reads .cursorrules and creates workflow]
```

Or reference skills directly:
```
You: "@.agent/.skills/n8n-automation/n8n-template-search/SKILL.md find templates"
```

**Time to start**: 2 minutes

</details>

---

<details>
<summary><strong>📦 Cline (VSCode)</strong> - Good Support</summary>

### Installation

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Convert to Cline format
./scripts/convert-to-rules.sh

# 3. Configure Cline (check Cline docs)

# 4. Reload VSCode
# Cmd/Ctrl+Shift+P → "Reload Window"
```

### Usage

Explicitly mention files:
```
You: "Read .agent/.agents/n8n-automation-expert.md and create webhook workflow"
```

Load specific skills:
```
You: "Read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md and find Slack templates"
```

**Time to start**: 5 minutes

</details>

---

<details>
<summary><strong>🔧 Continue.dev (VSCode)</strong> - Good Support</summary>

### Installation

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Convert to Continue.dev format
./scripts/convert-to-rules.sh

# 3. Reload VSCode
# Cmd/Ctrl+Shift+P → "Reload Window"
```

### Usage

Use custom commands:
```
/n8n-template-search webhook processing
/n8n-build "scheduled task workflow"
/n8n-debug "validation error"
```

Or naturally:
```
You: "Create n8n workflow for webhooks"
Continue: [Context providers load agent automatically]
```

**Time to start**: 3 minutes

</details>

---

<details>
<summary><strong>⚙️ Aider (CLI)</strong> - Manual but Powerful</summary>

### Installation

```bash
# 1. Install skills
npx ag-n8n-skills init

# 2. Generate usage instructions
./scripts/convert-to-rules.sh

# 3. Read AIDER_USAGE.md
cat AIDER_USAGE.md
```

### Usage

Load agent manually:
```bash
aider --read .agent/.agents/n8n-automation-expert.md
```

Load specific skills:
```bash
aider --read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md
# Then: "Find webhook templates"
```

Multiple skills:
```bash
aider \
  --read .agent/.agents/n8n-automation-expert.md \
  --read .agent/.skills/n8n-automation/n8n-workflow-patterns/SKILL.md
```

**Time to start**: 5 minutes

</details>

---

## 🔄 What is Rules Conversion?

The `.agent/` folder contains all skills in **universal Markdown format**. The conversion script creates **platform-specific files** that help your AI assistant find and use these skills more effectively.

### Before Conversion
```
your-project/
└── .agent/
    ├── .agents/n8n-automation-expert.md
    └── .skills/n8n-automation/...
```

### After Conversion
```
your-project/
├── .agent/                  ← Original (unchanged)
├── .cursorrules            ← New: Cursor
├── .windsurfrules          ← New: Windsurf
├── .clinerules             ← New: Cline
├── .continuerc.json        ← New: Continue.dev
└── AIDER_USAGE.md          ← New: Aider instructions
```

**Key Point**: Conversion doesn't duplicate or move files—it creates small reference files that point to `.agent/`.

---

## 📊 Quick Comparison

| Platform | Setup Time | Auto-detect | MCP Tools | Best For |
|----------|-----------|-------------|-----------|----------|
| **Antigravity** | 30s | ✅ Native | ✅ Native | Everyone ⭐ |
| **Claude Code** | 30s | ✅ Yes | ✅ Native | CLI users |
| **Windsurf** | 2m | ✅ Yes | 🟡 Community | IDE lovers |
| **Cursor** | 2m | ✅ Yes | 🟡 Planned | IDE lovers |
| **Cline** | 5m | ⚠️ Manual | 🟡 Config | VSCode users |
| **Continue.dev** | 3m | ✅ Yes | 🟡 Plugin | VSCode users |
| **Aider** | 5m | ❌ No | ❌ No | CLI lovers |

---

## 🆘 Troubleshooting

### "Conversion script not executable"

```bash
chmod +x scripts/convert-to-rules.sh
./scripts/convert-to-rules.sh
```

### "Skills not loading in my AI"

1. **Check files exist**:
   ```bash
   ls -la .agent/
   ls -la .cursorrules .windsurfrules .clinerules .continuerc.json
   ```

2. **Restart/reload your IDE**

3. **Check platform-specific docs**: See [COMPATIBILITY.md](COMPATIBILITY.md)

### "MCP tools not working"

MCP tools require configuration. For tools without native MCP support (unlike Antigravity or Claude), the skills will **automatically fallback to WebFetch** for template search.

**Claude Code/Desktop MCP setup**:
```json
// ~/.config/claude/config.json
{
  "mcpServers": {
    "n8n-mcp": {
      "command": "npx",
      "args": ["-y", "@leonardsellem/n8n-mcp-server"],
      "env": {
        "N8N_API_URL": "http://localhost:5678/api/v1",
        "N8N_API_KEY": "your-key"
      }
    }
  }
}
```

---

## 📚 More Information

- **Complete compatibility guide**: [COMPATIBILITY.md](COMPATIBILITY.md)
- **Full README**: [README.md](README.md)
- **Template search skill**: [.agent/.skills/n8n-automation/n8n-template-search/README.md](.agent/.skills/n8n-automation/n8n-template-search/README.md)
- **Changelog**: [CHANGELOG.md](CHANGELOG.md)

---

## 🚀 Next Steps

After installation:

1. ✅ **Verify installation**: Check that `.agent/` folder exists
2. ✅ **Convert (if needed)**: Run conversion script for your platform
3. ✅ **Restart/reload**: Restart your IDE or reload window
4. ✅ **Test it**: Ask to create a simple n8n workflow
5. ✅ **Explore skills**: Check out the 8 specialized skills

---

**Need help?** Open an issue: [github.com/julioborges/ag-n8n-skills/issues](https://github.com/julioborges/ag-n8n-skills/issues)
