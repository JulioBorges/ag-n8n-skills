---
name: n8n-template-search
description: Expert skill for discovering n8n workflow templates from multiple sources. Use when searching for workflow inspiration, finding template examples, exploring community workflows, or looking for specific workflow patterns in templates. Combines MCP tools with web search for comprehensive template discovery.
---

# n8n Template Search Expert

Comprehensive template discovery from n8n template library, community repositories, and web sources.

---

## What This Skill Does

This skill helps you discover and analyze n8n workflow templates from multiple sources:

1. **Built-in Template Library** (2,709+ templates via MCP tools)
2. **n8n Community Website** (https://n8n.io/workflows/)
3. **GitHub Repositories** (community templates and examples)
4. **n8n Forum & Documentation** (workflow examples and patterns)

---

## When to Use This Skill

Load this skill when you need to:

- Find existing templates that match user requirements
- Explore workflow examples for specific use cases
- Discover community patterns and best practices
- Find templates by node combinations
- Learn from real-world workflow implementations
- Get inspiration for workflow architecture

**Triggers**:
- User mentions: "find template", "workflow examples", "similar workflows"
- Keywords: template, example, community workflow, workflow library
- Building new workflows: always search templates first
- Need workflow inspiration or patterns

---

## Template Discovery Strategy

### Phase 1: MCP Template Library (ALWAYS FIRST)

**Why start here**:
- Fastest search (< 20ms)
- 2,709+ curated templates
- Structured data with metadata
- Direct deployment capability
- Author attribution and popularity metrics

**Search Modes**:

1. **Keyword Search** (Default)
```javascript
search_templates({
  query: "webhook slack notification",
  limit: 20
})
```

2. **Node-Based Search**
```javascript
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.webhook", "n8n-nodes-base.slack"]
})
```

3. **Task-Based Search**
```javascript
search_templates({
  searchMode: "by_task",
  task: "webhook_processing"  // or http_api, database_ops, ai_agent, scheduled_task
})
```

4. **Metadata Search**
```javascript
search_templates({
  searchMode: "by_metadata",
  complexity: "simple",       // simple, intermediate, advanced
  maxSetupMinutes: 15,
  category: "Communication"   // Optional: filter by category
})
```

### Phase 2: Web Template Discovery (If MCP insufficient)

**When to use**:
- Need recent templates not in MCP library
- Looking for specific community contributions
- Need context about template usage
- Want to see template variations

**Sources Priority**:

1. **n8n.io/workflows** (Official community templates)
   - Most reliable and up-to-date
   - Includes setup instructions
   - Community ratings and usage stats

2. **GitHub n8n-io/n8n** (Official examples)
   - Example workflows in repository
   - Documentation workflow examples
   - Integration examples

3. **n8n Community Forum** (Discussion-based examples)
   - Real-world use cases
   - Problem-solving workflows
   - Community support

---

## Search Pattern Matrix

| User Need | Primary Tool | Secondary Tool | Fallback |
|-----------|-------------|----------------|----------|
| Quick template match | `search_templates()` keyword | - | - |
| Specific node combo | `search_templates()` by_nodes | WebFetch n8n.io | - |
| Task pattern | `search_templates()` by_task | Load `n8n-workflow-patterns` | - |
| Recent/trending | WebFetch n8n.io/workflows | `search_templates()` | - |
| Complex use case | Multiple search modes | WebFetch + Forum search | GitHub examples |
| Learning examples | `search_templates()` + includeExamples | WebFetch tutorials | Documentation |

---

## Web Search Patterns

### Pattern 1: n8n.io Official Templates

```javascript
// Use WebFetch to search official template page
WebFetch({
  url: "https://n8n.io/workflows/",
  prompt: "Find templates for [specific use case]. Extract: template title, description, node types used, setup complexity, and direct link."
})

// Follow up with specific template page
WebFetch({
  url: "[template-url-from-search]",
  prompt: "Extract complete workflow structure: nodes used, connection patterns, configuration examples, and setup instructions."
})
```

### Pattern 2: GitHub Repository Search

```javascript
// Search n8n official repository for examples
WebFetch({
  url: "https://github.com/n8n-io/n8n/tree/master/packages/nodes-base/nodes",
  prompt: "Find example workflows for [specific node]. Extract: example usage, common patterns, configuration examples."
})

// Community workflows
WebFetch({
  url: "https://github.com/search?q=n8n+workflow+[topic]",
  prompt: "Find community n8n workflows for [topic]. Extract: repository links, workflow descriptions, unique approaches."
})
```

### Pattern 3: Community Forum

```javascript
WebFetch({
  url: "https://community.n8n.io/search?q=[topic]",
  prompt: "Find n8n community discussions about [topic]. Extract: workflow examples, solutions, best practices, common issues."
})
```

---

## Template Analysis Workflow

When you find relevant templates:

### Step 1: Quick Analysis
- **Purpose**: What problem does this template solve?
- **Complexity**: How many nodes? Setup time?
- **Prerequisites**: Required credentials, services, knowledge?
- **Customization**: How easy to adapt to user needs?

### Step 2: Deep Dive (if promising)
```javascript
// Get full template details
get_template({
  templateId: [id-from-search],
  mode: "full"  // Get complete workflow JSON
})

// Analyze structure
- Node types and versions
- Connection patterns
- Expression usage
- Error handling approach
- Data transformation logic
```

### Step 3: Deployment Decision
```javascript
// Option A: Deploy directly (if perfect match)
n8n_deploy_template({
  templateId: [id],
  autoFix: true,
  autoUpgradeVersions: true
})

// Option B: Use as reference (if needs customization)
// → Extract patterns and build custom workflow
```

---

## Search Query Optimization

### Effective Query Construction

**Good Queries** (Specific + Context):
- ✅ "webhook receive form data validate send slack"
- ✅ "schedule fetch api transform postgres"
- ✅ "ai agent with tools memory openai"
- ✅ "github webhook issues create jira tickets"

**Poor Queries** (Too generic):
- ❌ "slack"
- ❌ "automation"
- ❌ "api"

### Query Enhancement Strategy

```javascript
// Start broad, then narrow

// Step 1: Broad search
search_templates({query: "slack notification"})
// → 50 results, too many

// Step 2: Add specificity
search_templates({query: "webhook slack notification error"})
// → 15 results, better

// Step 3: Add context
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.webhook", "n8n-nodes-base.slack", "n8n-nodes-base.if"]
})
// → 8 results, perfect!
```

---

## Common Template Discovery Scenarios

### Scenario 1: "I want to build X"

**Process**:
1. Extract key components from user description
2. Search by task type: `search_templates({searchMode: "by_task"})`
3. Search by keywords: `search_templates({query: "[key terms]"})`
4. If no match: Search by nodes: `search_templates({searchMode: "by_nodes"})`
5. Still no match: WebFetch n8n.io/workflows for recent templates
6. Fallback: Load `n8n-workflow-patterns` for architectural guidance

### Scenario 2: "How do others handle Y?"

**Process**:
1. Search templates for Y: `search_templates({query: "Y"})`
2. Analyze multiple results for patterns
3. WebFetch community forum for discussions
4. Synthesize common approaches
5. Recommend best pattern with examples

### Scenario 3: "Does a template exist for Z?"

**Process**:
1. Multiple search strategies in parallel:
   - Keyword search
   - Node-based search (if Z implies specific nodes)
   - Task-based search (if Z matches a task type)
2. WebFetch n8n.io/workflows for verification
3. Clear yes/no answer with alternatives if no

### Scenario 4: "Show me examples of integration A + B"

**Process**:
1. `search_templates({searchMode: "by_nodes", nodeTypes: [A, B]})`
2. If results < 3: Expand to each individually
3. WebFetch for community examples
4. GitHub search for code examples
5. Synthesize patterns across sources

---

## Integration with Other Skills

### Skill Orchestration

```
Template Search Workflow:

1. n8n-template-search (THIS SKILL)
   ↓ Find relevant templates

2. n8n-mcp-tools-expert
   ↓ Get template details, validate

3. n8n-workflow-patterns
   ↓ Understand architectural pattern

4. n8n-node-configuration
   ↓ Configure specific nodes

5. n8n-validation-expert
   ↓ Validate customized workflow
```

**When to transition**:
- Found template → Load `n8n-mcp-tools-expert` to deploy
- No template → Load `n8n-workflow-patterns` to design
- Template has errors → Load `n8n-validation-expert`
- Need to customize nodes → Load `n8n-node-configuration`

---

## Template Quality Assessment

When evaluating templates, assess:

### ✅ High-Quality Templates
- Clear description of purpose
- Well-documented node configurations
- Proper error handling
- Reasonable complexity for task
- Active/validated credentials approach
- Good naming conventions
- Author reputation (if available)

### ⚠️ Medium-Quality Templates
- Basic functionality works
- Minimal documentation
- Some error handling
- May need updates for current n8n version
- Requires customization

### ❌ Low-Quality Templates
- Unclear purpose
- Hardcoded values
- No error handling
- Outdated node versions
- Incomplete configurations
- No documentation

**Action**: Always prefer high-quality templates. Medium-quality can be used as reference. Rebuild low-quality from scratch.

---

## Advanced Search Techniques

### Multi-Source Correlation

**Pattern**: Search multiple sources, correlate results

```javascript
// Step 1: MCP search
const mcpResults = search_templates({query: "topic"})

// Step 2: Web search (parallel)
const webResults = WebFetch({
  url: "https://n8n.io/workflows/?search=topic",
  prompt: "Extract: template names, descriptions, links"
})

// Step 3: Correlate
// - MCP templates by ID
// - Web templates by URL
// - Find overlap and unique items
// - Prioritize by source reliability

// Step 4: Present consolidated results
```

### Progressive Refinement

```javascript
// Start with broad search
let results = search_templates({query: "api integration"})

// Too many results? Add filters
if (results.length > 20) {
  results = search_templates({
    searchMode: "by_metadata",
    complexity: "simple",
    maxSetupMinutes: 30
  })
}

// Still too many? Add node filter
if (results.length > 10) {
  results = search_templates({
    searchMode: "by_nodes",
    nodeTypes: ["n8n-nodes-base.httpRequest", "specific-service-node"]
  })
}

// Present best matches
```

---

## Output Format

### When Presenting Template Results

```markdown
## 🔍 Template Search Results

**Query**: [user's search intent]

### Found Templates:

1. **[Template Name]** (ID: [id])
   - **Purpose**: [what it does]
   - **Nodes**: [key nodes used]
   - **Complexity**: [simple/intermediate/advanced]
   - **Setup Time**: [estimated minutes]
   - **Match Score**: [how well it fits user need]
   - **Action**: [Deploy directly / Use as reference / Customize]
   - 🔗 [View Template](link)

[Repeat for top 3-5 results]

### Recommendation:
[Best template for user's use case with reasoning]

### Alternative Approach:
[If no perfect match, suggest pattern from n8n-workflow-patterns]
```

---

## Best Practices

### ✅ Do

- Always search MCP templates first (fastest, most reliable)
- Use multiple search modes for comprehensive coverage
- Analyze top 3-5 results, not just first match
- Consider customization effort in recommendation
- Provide direct deployment option when available
- Include template links and IDs for easy access
- Explain why a template matches user's need
- Suggest alternatives if no perfect match

### ❌ Don't

- Skip MCP template search
- Only search by keyword (miss node/task matches)
- Present all results without filtering
- Recommend outdated or low-quality templates
- Assume template will work without validation
- Forget to mention required credentials/services
- Ignore web sources when MCP is insufficient

---

## Performance Characteristics

| Operation | Speed | Reliability | Coverage |
|-----------|-------|-------------|----------|
| `search_templates` (MCP) | <20ms | Very High | 2,709 templates |
| WebFetch n8n.io | 2-5s | High | Current templates |
| WebFetch GitHub | 3-7s | Medium | Code examples |
| WebFetch Forum | 3-7s | Medium | Community discussions |

**Optimization**: Use MCP first, WebFetch only when needed.

---

## Troubleshooting

### Issue: "No templates found"

**Solutions**:
1. Broaden query terms
2. Try different search modes (by_task, by_nodes)
3. Search web sources
4. Fall back to workflow patterns (load `n8n-workflow-patterns`)

### Issue: "Too many results"

**Solutions**:
1. Add more specific keywords
2. Filter by complexity/setup time
3. Use by_nodes mode with specific nodes
4. Ask user for more specificity

### Issue: "Template doesn't match exactly"

**Solutions**:
1. Use as reference, not direct deployment
2. Identify which parts match
3. Plan customization approach
4. Consider hybrid: template + custom nodes

---

## Examples

### Example 1: User Wants Webhook → Slack

```javascript
// Step 1: Search templates
search_templates({query: "webhook slack"})
// → Found 15 templates

// Step 2: Filter by simplicity
search_templates({
  searchMode: "by_metadata",
  complexity: "simple",
  query: "webhook slack"
})
// → Found 5 templates

// Step 3: Get best match details
get_template({templateId: 2947, mode: "full"})

// Step 4: Recommend deployment
"Found perfect match: Template #2947 'Webhook to Slack'
Deploy with: n8n_deploy_template({templateId: 2947, autoFix: true})"
```

### Example 2: No Template Match

```javascript
// Step 1: Search templates
search_templates({query: "shopify inventory google sheets sync"})
// → No direct matches

// Step 2: Search by nodes
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.shopify", "n8n-nodes-base.googleSheets"]
})
// → Still no matches

// Step 3: Web search
WebFetch({
  url: "https://n8n.io/workflows/?search=shopify",
  prompt: "Find Shopify integration templates"
})
// → No exact match

// Step 4: Recommend pattern approach
"No direct template found. Based on requirements, this matches
'Database Sync' pattern. Load n8n-workflow-patterns skill for guidance."
```

---

## Summary

**Key Points**:
1. **Always start with MCP** `search_templates()` - fastest and most reliable
2. **Use multiple search modes** - keyword, nodes, task, metadata
3. **WebFetch for gaps** - recent templates, community examples
4. **Quality assessment** - evaluate before recommending
5. **Transition to other skills** - patterns if no template, validation after deployment

**Next Steps After Template Search**:
1. Template found → Deploy with `n8n-mcp-tools-expert`
2. No template → Design with `n8n-workflow-patterns`
3. Template needs fixes → Validate with `n8n-validation-expert`
4. Customize template → Configure with `n8n-node-configuration`

---

**Related Skills**:
- n8n-mcp-tools-expert - Deploy and manage templates
- n8n-workflow-patterns - Design patterns when no template exists
- n8n-validation-expert - Validate deployed templates
- n8n-node-configuration - Customize template nodes
