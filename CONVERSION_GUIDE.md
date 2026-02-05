# Rules Conversion Guide

Quick guide to converting `.agent/` format to platform-specific rules files.
> **Note**: Antigravity and Claude Code users do **not** need this guide (native support).

---

## 🎯 What is Rules Conversion?

**Problem**: Different AI assistants prefer different file formats.

**Solution**: Convert the universal `.agent/` format into platform-specific files.

**Result**: Your AI assistant finds and uses skills automatically!

---

## 🔄 One-Command Conversion

```bash
./scripts/convert-to-rules.sh
```

**That's it!** The script creates 5 files for different platforms.

---

## 📁 What Gets Created

### Input (Already exists after `npx ag-n8n-skills init`)
```
.agent/
├── .agents/
│   └── n8n-automation-expert.md
└── .skills/
    └── n8n-automation/
        ├── n8n-template-search/
        ├── n8n-mcp-tools-expert/
        └── ... (6 more skills)
```

### Output (Created by conversion script)
```
.cursorrules              ← For Cursor IDE
.windsurfrules           ← For Windsurf IDE
.clinerules              ← For Cline (VSCode)
.continuerc.json         ← For Continue.dev (VSCode)
AIDER_USAGE.md           ← For Aider CLI
```

---

## 📝 File Explanations

### `.cursorrules` (Cursor IDE)

**Purpose**: Rules file that Cursor reads on startup

**What it contains**:
- Agent instructions
- Skill loading paths
- Workflow guidelines
- @ mention references

**Auto-detected**: ✅ Yes (restart Cursor after creation)

**Example usage**:
```
You: "Create webhook workflow @n8n-automation-expert"
Cursor: [Loads agent from .cursorrules reference]
```

---

### `.windsurfrules` (Windsurf IDE)

**Purpose**: Rules file for Windsurf's agent system

**What it contains**:
- Agent behavior guidelines
- Skills directory structure
- Reference paths for all skills
- Core workflow process

**Auto-detected**: ✅ Yes (restart Windsurf after creation)

**Example usage**:
```
You: "Build n8n workflow for Slack"
Windsurf: [Reads .windsurfrules and loads agent]
```

---

### `.clinerules` (Cline VSCode Extension)

**Purpose**: Configuration hints for Cline

**What it contains**:
- Agent profile
- Skills location paths
- Loading instructions
- Key usage rules

**Auto-detected**: ⚠️ Requires manual Cline configuration

**Example usage**:
```
You: "Read .agent/.agents/n8n-automation-expert.md and create workflow"
Cline: [Uses .clinerules as reference]
```

---

### `.continuerc.json` (Continue.dev VSCode Extension)

**Purpose**: JSON configuration for Continue.dev

**What it contains**:
```json
{
  "contextProviders": [...],
  "customCommands": [
    {
      "name": "n8n-template-search",
      "prompt": "Load skill and search..."
    },
    {
      "name": "n8n-build",
      "prompt": "Load agent and build..."
    }
  ]
}
```

**Auto-detected**: ✅ Yes (reload VSCode after creation)

**Example usage**:
```
/n8n-template-search webhook
/n8n-build "scheduled task"
```

---

### `AIDER_USAGE.md` (Aider CLI)

**Purpose**: Instructions document for Aider users

**What it contains**:
- Command-line examples
- File loading patterns
- Common workflows
- Tips and tricks

**Auto-detected**: ❌ No (manual reference)

**Example usage**:
```bash
# Load agent
aider --read .agent/.agents/n8n-automation-expert.md

# Load specific skill
aider --read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md
```

---

## 🎬 Conversion Process Explained

### Step 1: Read Source
```bash
# Script reads the main agent file
.agent/.agents/n8n-automation-expert.md
```

### Step 2: Extract Information
```bash
# Extracts:
- Agent instructions
- Skill paths and references
- Workflow guidelines
- Usage patterns
```

### Step 3: Generate Platform Files
```bash
# Creates 5 different formats:
✅ .cursorrules        (Markdown, ~80 lines)
✅ .windsurfrules      (Markdown, ~70 lines)
✅ .clinerules         (Markdown, ~40 lines)
✅ .continuerc.json    (JSON, ~30 lines)
✅ AIDER_USAGE.md      (Markdown, ~100 lines)
```

### Step 4: Write Files
```bash
# Writes to project root
# Preserves .agent/ folder (no changes)
```

---

## ⚙️ Script Options

### Basic Usage
```bash
./scripts/convert-to-rules.sh
```

### View Script Source
```bash
cat scripts/convert-to-rules.sh
```

### Debug Mode
```bash
bash -x scripts/convert-to-rules.sh
```

### Make Executable (if needed)
```bash
chmod +x scripts/convert-to-rules.sh
```

---

## 🔄 When to Re-run

Re-run the conversion script when:

1. **Updated `.agent/` content**
   ```bash
   # After modifying agent or skills
   ./scripts/convert-to-rules.sh
   ```

2. **Switched AI assistant**
   ```bash
   # Moving from Cursor to Windsurf
   ./scripts/convert-to-rules.sh
   ```

3. **Rules file corrupted/deleted**
   ```bash
   # Recreate rules files
   ./scripts/convert-to-rules.sh
   ```

4. **Want fresh defaults**
   ```bash
   # Overwrite customizations
   ./scripts/convert-to-rules.sh
   ```

**Safe to run multiple times** - Overwrites existing files cleanly.

---

## 📊 Conversion Matrix

| Original | Cursor | Windsurf | Cline | Continue | Aider |
|----------|--------|----------|-------|----------|-------|
| `.agent/` ✅ | `.cursorrules` | `.windsurfrules` | `.clinerules` | `.continuerc.json` | `AIDER_USAGE.md` |
| 2,500 lines | 80 lines | 70 lines | 40 lines | 30 lines | 100 lines |
| Full content | References | References | Hints | Config | Instructions |

**Key**: Rules files don't duplicate content—they reference `.agent/` folder.

---

## ✅ Verification Steps

### 1. Check Files Created
```bash
ls -la | grep -E '\.(cursorrules|windsurfrules|clinerules|continuerc)'
ls -la AIDER_USAGE.md
```

**Expected output**:
```
.clinerules
.continuerc.json
.cursorrules
.windsurfrules
AIDER_USAGE.md
```

### 2. Check File Contents
```bash
# Cursor rules
head -20 .cursorrules

# Windsurf rules
head -20 .windsurfrules

# Continue.dev config
cat .continuerc.json | jq
```

### 3. Test with Your AI
- **Cursor/Windsurf**: Restart IDE, ask "Create n8n workflow"
- **Cline**: Reload VSCode, reference files explicitly
- **Continue.dev**: Reload VSCode, try `/n8n-build`
- **Aider**: Read `AIDER_USAGE.md` for commands

---

## 🆘 Troubleshooting

### "Permission denied"
```bash
chmod +x scripts/convert-to-rules.sh
./scripts/convert-to-rules.sh
```

### "Script not found"
```bash
# Make sure you're in project root
ls scripts/convert-to-rules.sh

# If missing, reinstall
npx ag-n8n-skills init --force
```

### "Files not created"
```bash
# Check script output for errors
./scripts/convert-to-rules.sh 2>&1 | tee conversion.log

# Verify .agent/ folder exists
ls -la .agent/
```

### "AI not loading rules"
1. **Restart/reload** your IDE/editor
2. **Check platform docs** for rules file location
3. **Verify file format** (Markdown vs JSON)
4. **See** [COMPATIBILITY.md](COMPATIBILITY.md) for platform-specific help

---

## 📚 Related Documentation

- **Quick Start**: [QUICK_START.md](QUICK_START.md)
- **Compatibility Guide**: [COMPATIBILITY.md](COMPATIBILITY.md)
- **Main README**: [README.md](README.md)
- **Template Search**: [.agent/.skills/n8n-automation/n8n-template-search/README.md](.agent/.skills/n8n-automation/n8n-template-search/README.md)

---

## 💡 Tips

### Customize Rules Files
Rules files are yours to customize! After generation:

```bash
# Edit Cursor rules
code .cursorrules

# Edit Windsurf rules
code .windsurfrules

# Customize Continue.dev config
code .continuerc.json
```

### Keep `.agent/` Pristine
The `.agent/` folder is the **source of truth**. Don't modify it unless:
- Adding custom skills
- Updating agent behavior
- Creating project-specific adaptations

Rules files can be regenerated anytime from `.agent/`.

### Version Control
```bash
# Add to git
git add .cursorrules .windsurfrules .clinerules .continuerc.json AIDER_USAGE.md

# Or ignore platform-specific files
echo ".cursorrules" >> .gitignore
echo ".windsurfrules" >> .gitignore
# Users can regenerate with script
```

---

**Need help?** See [COMPATIBILITY.md](COMPATIBILITY.md) or open an issue: [github.com/julioborges/ag-n8n-skills/issues](https://github.com/julioborges/ag-n8n-skills/issues)
