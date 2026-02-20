# n8n Skills Kit Architecture

## 📋 Overview
n8n Skills Kit is a specialized agentic system designed for building, validating, debugging, and deploying production-ready n8n workflows. It consists of:

- **1 Specialist Agent** - The primary AI persona for workflow automation
- **1 Master Skill**  - Orchestrator of specialized sub-skills
- **8 Sub-Skills** - Domain-specific knowledge modules for n8n

---

## 🏗️ Directory Structure
```plaintext
.agent/
├── ARCHITECTURE.md          # This file
├── agents/                  # Specialist Agents (1)
└── skills/                  # Skills (1 Master + 8 Sub-skills)
    └── n8n-automation/      # Master orchestration skill
```

---

## 🤖 Agents (1)
Specialist AI persona for n8n automation tasks.

| Agent                    | Focus                      | Skills Used                                              |
| ------------------------ | -------------------------- | -------------------------------------------------------- |
| `n8n-automation-expert`  | Building production-ready n8n workflows, troubleshooting, and deploying | `n8n-automation` (master skill) |

---

## 🧩 Skills (9)
Modular knowledge domains that the agent loads on-demand based on the task context. 
It operates using a **Master Skill Pattern**, where the `n8n-automation` skill acts as an orchestrator that contains and loads various specialized sub-skills.

### Master Skill
| Skill              | Purpose |
|--------------------|---------|
| `n8n-automation`   | Master skill for building production-ready n8n workflows. Orchestrates 8 specialized sub-skills. |

### Sub-Skills
| Skill | Purpose | When Activated |
|-------|---------|----------------|
| `n8n-template-search` | Template discovery | Finding workflow templates, examples |
| `n8n-mcp-tools-expert` | MCP tool usage | Searching nodes, templates, validating |
| `n8n-workflow-patterns` | Architectural patterns | Creating new workflows |
| `n8n-expression-syntax` | Expression syntax | `$json`, `$node` references |
| `n8n-validation-expert` | Error handling | Validation failures, debugging |
| `n8n-node-configuration` | Node parameters | Configuring complex nodes |
| `n8n-code-javascript` | JavaScript code | Code node JS scripting |
| `n8n-code-python` | Python code | Code node Python scripting |

---

## 🎯 Skill Loading Protocol
The n8n automation expert uses a specific decision tree to dynamically load knowledge:

```plaintext
User Request → Identify Automation Task → Load n8n-automation (Master Skill)
                                            ↓
                                  Determine Specific Need
                                            ↓
    ├─ Searching for nodes/templates? → Load n8n-mcp-tools-expert / n8n-template-search
    ├─ Writing expressions? → Load n8n-expression-syntax
    ├─ Choosing workflow structure? → Load n8n-workflow-patterns
    ├─ Validation failed? → Load n8n-validation-expert
    ├─ Configuring nodes? → Load n8n-node-configuration
    ├─ Writing JavaScript code? → Load n8n-code-javascript
    └─ Writing Python code? → Load n8n-code-python
```

---

## 🔄 Workflow Creation Process
The agent follows a strict internal process when handling automation requests to guarantee high-quality workflows:

1. **Discovery (ALWAYS FIRST):** Search for existing templates. If no templates fit the task, discover dedicated nodes instead.
2. **Configuration:** Fetch details for specific nodes and define all parameters. Never trust default values.
3. **Expression & Code Writing:** Add JS/Python logic through proper expression syntax or Code nodes.
4. **Validation:** Continuously evaluate configurations using MCP tools (`validate_node`, `validate_workflow`).
5. **Build & Deploy:** Assemble validated nodes and deploy the workflow to the correct environment.
