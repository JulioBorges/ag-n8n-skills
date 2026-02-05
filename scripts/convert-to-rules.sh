#!/bin/bash
# Convert .agent/ structure to various AI coding assistants

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🔄 Converting .agent/ structure to various formats..."

# Function to create Cursor rules
create_cursor_rules() {
    echo "📝 Creating .cursorrules..."
    cat > "$PROJECT_ROOT/.cursorrules" << 'EOF'
# n8n Automation Expert Rules

You are an expert n8n workflow architect with 8+ years experience.

## Available Skills
Load these skills from `.agent/.skills/n8n-automation/` when needed:

- **n8n-template-search**: Template discovery (MCP + Web)
  - Load when: Finding templates, workflow examples
  - Path: @.agent/.skills/n8n-automation/n8n-template-search/SKILL.md

- **n8n-mcp-tools-expert**: MCP tool usage
  - Load when: Using search_nodes, validate_node, etc.
  - Path: @.agent/.skills/n8n-automation/n8n-mcp-tools-expert/SKILL.md

- **n8n-workflow-patterns**: Architectural patterns
  - Load when: Designing workflow structure
  - Path: @.agent/.skills/n8n-automation/n8n-workflow-patterns/SKILL.md

- **n8n-expression-syntax**: Expressions ($json, $node)
  - Load when: Writing {{$json}} expressions
  - Path: @.agent/.skills/n8n-automation/n8n-expression-syntax/SKILL.md

- **n8n-validation-expert**: Error handling & debugging
  - Load when: Validation errors occur
  - Path: @.agent/.skills/n8n-automation/n8n-validation-expert/SKILL.md

- **n8n-node-configuration**: Node parameters
  - Load when: Configuring complex nodes
  - Path: @.agent/.skills/n8n-automation/n8n-node-configuration/SKILL.md

- **n8n-code-javascript**: JavaScript code nodes
  - Load when: Writing JS in Code nodes
  - Path: @.agent/.skills/n8n-automation/n8n-code-javascript/SKILL.md

- **n8n-code-python**: Python code nodes
  - Load when: Writing Python in Code nodes
  - Path: @.agent/.skills/n8n-automation/n8n-code-python/SKILL.md

## Workflow Process
1. **Template Search (ALWAYS FIRST)**: Search templates before building
2. **Node Discovery**: Find required nodes if no template
3. **Build**: Create workflow with proper configuration
4. **Validate**: Validate at every step
5. **Deploy**: Test and activate

## Key Principles
- ✅ Search templates first (2,709+ available)
- ✅ Validate early and often
- ✅ Never trust defaults - configure explicitly
- ✅ Implement error handling
- ✅ Load specific skill when encountering complexity

For full agent documentation, see: @.agent/.agents/n8n-automation-expert.md
EOF
    echo "✅ Created .cursorrules"
}

# Function to create Windsurf rules
create_windsurf_rules() {
    echo "📝 Creating .windsurfrules..."
    cat > "$PROJECT_ROOT/.windsurfrules" << 'EOF'
# n8n Automation Expert Rules for Windsurf

You are an expert n8n workflow architect.

## Skills Directory Structure
All skills are in `.agent/.skills/n8n-automation/`:

```
.agent/.skills/n8n-automation/
├── n8n-template-search/    # Template discovery
├── n8n-mcp-tools-expert/   # MCP tool usage
├── n8n-workflow-patterns/  # Architectural patterns
├── n8n-expression-syntax/  # Expression syntax
├── n8n-validation-expert/  # Error handling
├── n8n-node-configuration/ # Node parameters
├── n8n-code-javascript/    # JavaScript code
└── n8n-code-python/        # Python code
```

## When to Load Skills

Reference these files when needed:
- Template search: `.agent/.skills/n8n-automation/n8n-template-search/SKILL.md`
- MCP tools: `.agent/.skills/n8n-automation/n8n-mcp-tools-expert/SKILL.md`
- Workflow patterns: `.agent/.skills/n8n-automation/n8n-workflow-patterns/SKILL.md`
- Expressions: `.agent/.skills/n8n-automation/n8n-expression-syntax/SKILL.md`
- Validation: `.agent/.skills/n8n-automation/n8n-validation-expert/SKILL.md`
- Node config: `.agent/.skills/n8n-automation/n8n-node-configuration/SKILL.md`
- JavaScript: `.agent/.skills/n8n-automation/n8n-code-javascript/SKILL.md`
- Python: `.agent/.skills/n8n-automation/n8n-code-python/SKILL.md`

## Core Process
1. Search templates FIRST (always!)
2. Load appropriate skill for complexity
3. Validate at every step
4. Configure parameters explicitly
5. Implement error handling

See `.agent/.agents/n8n-automation-expert.md` for complete guidelines.
EOF
    echo "✅ Created .windsurfrules"
}

# Function to create Cline rules
create_cline_rules() {
    echo "📝 Creating .clinerules..."
    cat > "$PROJECT_ROOT/.clinerules" << 'EOF'
# n8n Automation Expert - Cline Configuration

## Agent Profile
Expert n8n workflow architect with 8 specialized skills.

## Skills Location
All skills are in: `.agent/.skills/n8n-automation/`

To load a skill, read the corresponding SKILL.md file.

## Available Skills
1. n8n-template-search - Template discovery
2. n8n-mcp-tools-expert - MCP tool usage
3. n8n-workflow-patterns - Architectural patterns
4. n8n-expression-syntax - Expression syntax
5. n8n-validation-expert - Error handling
6. n8n-node-configuration - Node parameters
7. n8n-code-javascript - JavaScript code
8. n8n-code-python - Python code

## Usage Pattern
When user requests n8n work:
1. Read: `.agent/.agents/n8n-automation-expert.md`
2. Follow workflow: Template Search → Build → Validate
3. Load specific skills as needed

## Key Rules
- Always search templates first
- Validate at every step
- Configure parameters explicitly
- Implement error handling
- Load skills when encountering complexity
EOF
    echo "✅ Created .clinerules"
}

# Function to create Continue.dev config
create_continue_config() {
    echo "📝 Creating .continuerc.json..."
    cat > "$PROJECT_ROOT/.continuerc.json" << 'EOF'
{
  "name": "n8n Automation Expert",
  "contextProviders": [
    {
      "name": "n8n-agent",
      "params": {
        "path": ".agent/.agents/n8n-automation-expert.md"
      }
    },
    {
      "name": "n8n-skills",
      "params": {
        "path": ".agent/.skills/n8n-automation/"
      }
    }
  ],
  "customCommands": [
    {
      "name": "n8n-template-search",
      "description": "Search for n8n workflow templates",
      "prompt": "Load .agent/.skills/n8n-automation/n8n-template-search/SKILL.md and help me find templates for: {input}"
    },
    {
      "name": "n8n-build",
      "description": "Build n8n workflow",
      "prompt": "Load .agent/.agents/n8n-automation-expert.md and help me build: {input}"
    },
    {
      "name": "n8n-debug",
      "description": "Debug n8n workflow",
      "prompt": "Load .agent/.skills/n8n-automation/n8n-validation-expert/SKILL.md and help me debug: {input}"
    }
  ]
}
EOF
    echo "✅ Created .continuerc.json"
}

# Function to create Aider instructions
create_aider_instructions() {
    echo "📝 Creating AIDER_USAGE.md..."
    cat > "$PROJECT_ROOT/AIDER_USAGE.md" << 'EOF'
# Using n8n Skills with Aider

## Loading the Agent

```bash
# Load main agent
aider --read .agent/.agents/n8n-automation-expert.md

# Load specific skill
aider --read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md

# Load multiple skills
aider \
  --read .agent/.agents/n8n-automation-expert.md \
  --read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md \
  --read .agent/.skills/n8n-automation/n8n-workflow-patterns/SKILL.md
```

## Common Commands

### Template Search
```bash
aider --read .agent/.skills/n8n-automation/n8n-template-search/SKILL.md
# Then: "Find templates for webhook processing"
```

### Build Workflow
```bash
aider --read .agent/.agents/n8n-automation-expert.md
# Then: "Create a workflow that sends Slack notifications"
```

### Debug Workflow
```bash
aider --read .agent/.skills/n8n-automation/n8n-validation-expert/SKILL.md
# Then: "My workflow validation failed with [error]"
```

## Tips
- Load main agent for general guidance
- Load specific skills for specialized tasks
- Can add multiple --read flags to load multiple files
- Skills work without MCP by using manual approaches
EOF
    echo "✅ Created AIDER_USAGE.md"
}

# Main execution
echo ""
echo "🎯 Target formats:"
echo "  - Cursor (.cursorrules)"
echo "  - Windsurf (.windsurfrules)"
echo "  - Cline (.clinerules)"
echo "  - Continue.dev (.continuerc.json)"
echo "  - Aider (AIDER_USAGE.md)"
echo ""

create_cursor_rules
create_windsurf_rules
create_cline_rules
create_continue_config
create_aider_instructions

echo ""
echo "✅ Conversion complete!"
echo ""
echo "📁 Created files:"
echo "  - .cursorrules"
echo "  - .windsurfrules"
echo "  - .clinerules"
echo "  - .continuerc.json"
echo "  - AIDER_USAGE.md"
echo ""
echo "🚀 Now compatible with multiple AI coding assistants!"
echo ""
echo "📖 Usage:"
echo "  Cursor:      Just open project (auto-detects .cursorrules)"
echo "  Windsurf:    Just open project (auto-detects .windsurfrules)"
echo "  Cline:       Configure in VSCode to read .clinerules"
echo "  Continue:    Reads .continuerc.json automatically"
echo "  Aider:       See AIDER_USAGE.md for commands"
