# n8n Template Search Skill

Expert skill for discovering n8n workflow templates from multiple sources.

## Overview

This skill provides comprehensive template discovery capabilities by combining:
- **MCP Template Library** (2,709+ curated templates)
- **n8n.io Community Website** (latest community templates)
- **GitHub Repositories** (example workflows and patterns)
- **Community Forums** (real-world use cases)

## Quick Start

### Basic Template Search

```javascript
// Search by keyword
search_templates({
  query: "webhook slack notification"
})

// Search by node types
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.webhook", "n8n-nodes-base.slack"]
})

// Search by task type
search_templates({
  searchMode: "by_task",
  task: "webhook_processing"
})
```

### Web Template Search

```javascript
// Search n8n.io official templates
WebFetch({
  url: "https://n8n.io/workflows/",
  prompt: "Find templates for Stripe payment processing. Extract: title, description, node types, complexity."
})

// Get specific template details
WebFetch({
  url: "https://n8n.io/workflows/2947",
  prompt: "Extract complete workflow structure and setup instructions."
})
```

## When to Use This Skill

Load this skill when:
- ✅ User asks for workflow examples or templates
- ✅ Starting a new workflow project (always search first!)
- ✅ Looking for specific integration patterns
- ✅ Need inspiration for workflow architecture
- ✅ Want to learn from community best practices

## Template Discovery Strategy

### Phase 1: MCP Template Library (ALWAYS FIRST)

**Why start here**:
- Fastest (< 20ms response time)
- 2,709+ curated templates
- Structured metadata (complexity, setup time, nodes)
- Direct deployment capability
- No web latency

**Search Modes**:
1. **Keyword** - Natural language search
2. **by_nodes** - Find templates using specific node combinations
3. **by_task** - Find templates by workflow pattern type
4. **by_metadata** - Filter by complexity, setup time, category

### Phase 2: Web Discovery (If MCP Insufficient)

**When to use**:
- Need recent templates (last 30 days)
- Looking for trending workflows
- Need setup instructions and context
- Want community ratings and feedback

**Sources**:
1. **n8n.io/workflows** (Official, most reliable)
2. **GitHub n8n-io/n8n** (Official examples)
3. **Community Forum** (Real-world use cases)

## Search Pattern Examples

### Example 1: Simple Integration

**User Request**: "I need to send Slack notifications when a webhook is received"

**Search Strategy**:
```javascript
// Step 1: Quick keyword search
search_templates({query: "webhook slack"})
// Result: 15 templates found

// Step 2: Filter by simplicity
search_templates({
  searchMode: "by_metadata",
  complexity: "simple",
  maxSetupMinutes: 15
})
// Result: 5 templates found

// Step 3: Select best match
// Template #2947: "Webhook to Slack Notification"
// → Direct deployment recommended
```

### Example 2: Complex Integration

**User Request**: "Sync Shopify inventory with Google Sheets every hour"

**Search Strategy**:
```javascript
// Step 1: Search by nodes
search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.shopify", "n8n-nodes-base.googleSheets"]
})
// Result: No exact match

// Step 2: Search by task + individual nodes
search_templates({searchMode: "by_task", task: "scheduled_task"})
search_templates({query: "shopify"})
search_templates({query: "google sheets sync"})
// Result: Partial matches found

// Step 3: Web search for recent community templates
WebFetch({
  url: "https://n8n.io/workflows/?search=shopify+inventory",
  prompt: "Find Shopify inventory management templates"
})
// Result: Community examples found

// Step 4: If still no match → Load n8n-workflow-patterns
// Recommend: "Scheduled Task" pattern with custom implementation
```

### Example 3: AI Workflow

**User Request**: "Create a chatbot with memory that can search my database"

**Search Strategy**:
```javascript
// Step 1: Search by task type
search_templates({
  searchMode: "by_task",
  task: "ai_agent_workflow"
})
// Result: AI agent templates found

// Step 2: Filter by node types
search_templates({
  searchMode: "by_nodes",
  nodeTypes: [
    "@n8n/n8n-nodes-langchain.agent",
    "@n8n/n8n-nodes-langchain.memoryBufferWindow",
    "n8n-nodes-base.postgres"  // or relevant database
  ]
})
// Result: Specific AI + DB templates

// Step 3: Analyze top results
get_template({templateId: [found-id], mode: "full"})
// → Deploy or customize based on analysis
```

## Template Quality Assessment

### High-Quality Template Indicators
- ✅ Clear purpose and description
- ✅ Well-documented node configurations
- ✅ Proper error handling implemented
- ✅ Current n8n version compatibility
- ✅ Active/validated credentials approach
- ✅ Good naming conventions
- ✅ Author reputation (if available)

### Red Flags
- ❌ Hardcoded credentials or values
- ❌ No error handling
- ❌ Outdated node versions
- ❌ Incomplete or broken configurations
- ❌ No documentation or unclear purpose

## Integration with Other Skills

### Workflow: Template Search → Deployment

```
1. n8n-template-search (THIS SKILL)
   ├─ Search MCP library
   ├─ Search web sources
   └─ Analyze and recommend

2. n8n-mcp-tools-expert
   ├─ Get template details
   ├─ Deploy template
   └─ Validate deployment

3. n8n-validation-expert (if issues)
   ├─ Diagnose validation errors
   └─ Fix configuration issues

4. n8n-node-configuration (for customization)
   └─ Configure specific node operations
```

### Workflow: No Template → Custom Build

```
1. n8n-template-search (THIS SKILL)
   └─ Confirm no suitable template exists

2. n8n-workflow-patterns
   ├─ Choose architectural pattern
   └─ Plan workflow structure

3. n8n-mcp-tools-expert
   ├─ Search nodes
   ├─ Build workflow
   └─ Deploy

4. n8n-node-configuration
   └─ Configure complex nodes

5. n8n-validation-expert
   └─ Validate complete workflow
```

## Advanced Search Techniques

### Multi-Source Correlation

Combine MCP and web search for comprehensive coverage:

```javascript
// Parallel search across sources
const results = {
  mcp: search_templates({query: "topic"}),
  web: WebFetch({url: "https://n8n.io/workflows/?search=topic"}),
  github: WebFetch({url: "github search url"})
}

// Correlate and deduplicate
// Prioritize by source reliability: MCP > n8n.io > GitHub > Forum
// Present consolidated, ranked results
```

### Progressive Refinement

Start broad, narrow based on results:

```javascript
// Step 1: Broad search
let results = search_templates({query: "api"})
// → 200 results (too many)

// Step 2: Add specificity
results = search_templates({query: "rest api authentication"})
// → 50 results (still many)

// Step 3: Filter by complexity
results = search_templates({
  searchMode: "by_metadata",
  complexity: "simple",
  maxSetupMinutes: 30
})
// → 12 results (manageable)

// Step 4: Final node filter if needed
results = search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.httpRequest", "n8n-nodes-base.jwt"]
})
// → 5 results (perfect)
```

## Search Query Optimization

### Good Queries (Specific + Context)
- ✅ "webhook receive form data validate send slack"
- ✅ "schedule fetch weather api transform notify"
- ✅ "ai agent tools memory database search"
- ✅ "github webhook create jira ticket"

### Poor Queries (Too Generic)
- ❌ "slack"
- ❌ "api"
- ❌ "automation"
- ❌ "webhook"

### Query Enhancement Process

```
User Query: "I want to use Slack"

Internal Enhancement:
1. What's the trigger? → webhook/schedule/manual?
2. What's the action? → send message/create channel/update?
3. What's the data source? → form/api/database?
4. What's the flow? → simple notification/conditional/complex?

Enhanced Query: "webhook form submission validate send slack channel"
```

## Output Format Template

When presenting template search results:

```markdown
## 🔍 Template Search Results

**Search Query**: "[user's intent]"
**Sources Searched**: MCP Library, n8n.io, [others if used]

### ✨ Top Matches:

#### 1. [Template Name] (⭐ Recommended)
- **ID**: [template-id]
- **Purpose**: [clear description]
- **Nodes**: [key nodes, e.g., Webhook → Set → Slack]
- **Complexity**: [Simple/Intermediate/Advanced]
- **Setup Time**: ~[X] minutes
- **Match Score**: [High/Medium/Low]
- **Pros**: [what makes it a good fit]
- **Cons**: [what might need customization]
- **Action**: `n8n_deploy_template({templateId: [id], autoFix: true})`
- 🔗 [View Details](link)

[Repeat for top 2-3 templates]

### 💡 Recommendation:
[Clear recommendation with reasoning]

### 🔄 Alternative Approach:
[If no perfect match, suggest building from pattern]
```

## Performance Metrics

| Operation | Response Time | Coverage | Reliability |
|-----------|--------------|----------|-------------|
| MCP keyword search | <20ms | 2,709 templates | Very High |
| MCP node search | <30ms | 2,709 templates | Very High |
| MCP task search | <25ms | 5 task categories | Very High |
| WebFetch n8n.io | 2-5s | Current templates | High |
| WebFetch GitHub | 3-7s | Code examples | Medium |
| WebFetch Forum | 3-7s | Community posts | Medium |

**Best Practice**: Always start with MCP (fastest), use WebFetch only when needed.

## Troubleshooting

### Problem: No Templates Found

**Solutions**:
1. Broaden search terms
2. Try different search modes (by_task, by_nodes)
3. Search individual nodes separately
4. Use web sources for recent templates
5. Fall back to workflow patterns (load `n8n-workflow-patterns`)

### Problem: Too Many Results

**Solutions**:
1. Add more specific keywords
2. Filter by complexity: `{complexity: "simple"}`
3. Filter by setup time: `{maxSetupMinutes: 30}`
4. Use by_nodes mode with specific nodes
5. Ask user for more specificity

### Problem: Template Doesn't Match Exactly

**Solutions**:
1. Assess customization effort required
2. Use template as reference, not direct deployment
3. Identify which components match
4. Consider hybrid: template base + custom nodes
5. If too different, build from pattern instead

## Best Practices

### ✅ Do
- Always search MCP templates first
- Use multiple search modes for comprehensive coverage
- Analyze top 3-5 results, not just first match
- Assess quality before recommending
- Provide deployment command for good matches
- Explain match reasoning to user
- Include links for user reference
- Suggest alternatives if no perfect match

### ❌ Don't
- Skip MCP template search
- Only use keyword search (miss node/task matches)
- Present all results without filtering
- Recommend low-quality or outdated templates
- Assume template will work without validation
- Forget to mention prerequisites (credentials, services)
- Use web search when MCP is sufficient

## Related Documentation

- [SKILL.md](SKILL.md) - Complete skill specification
- [SEARCH_STRATEGIES.md](SEARCH_STRATEGIES.md) - Advanced search patterns
- [WEB_SOURCES.md](WEB_SOURCES.md) - Web source reference guide

## Related Skills

- **n8n-mcp-tools-expert** - Deploy and manage templates
- **n8n-workflow-patterns** - Design patterns when no template
- **n8n-validation-expert** - Validate deployed templates
- **n8n-node-configuration** - Customize template nodes
