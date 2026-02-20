# Web Sources Reference Guide

Comprehensive guide to web-based template discovery sources and WebFetch patterns.

---

## Source Overview

### Source Priority Matrix

| Source | Reliability | Speed | Coverage | Update Frequency | Use Case |
|--------|-------------|-------|----------|------------------|----------|
| n8n.io/workflows | Very High | 2-5s | 2,500+ | Daily | Primary web source |
| n8n GitHub repo | High | 3-7s | 200+ | Weekly | Code examples |
| n8n workflows GitHub repo | High | 3-10s | 4,500+ | Variable | Code examples |
| Community Forum | Medium | 3-7s | 1,000+ | Daily | Real-world usage |
| n8n Documentation | High | 2-4s | 100+ | Monthly | Official examples |
| YouTube/Blog | Low-Medium | 5-10s | Variable | Variable | Tutorials |

---

## Source 1: n8n.io/workflows (Official Templates)

### Overview
- **URL**: `https://n8n.io/workflows/`
- **Content**: Community-submitted and curated workflows
- **Update Frequency**: Multiple times daily
- **Reliability**: Very High (curated by n8n team)

### Search Patterns

#### Pattern 1: Keyword Search

```javascript
WebFetch({
  url: "https://n8n.io/workflows/?search=[query]",
  prompt: `
    Find n8n workflow templates matching: [query]
    Extract for each result:
    - Template title
    - Brief description (1-2 sentences)
    - Node types used (list)
    - Complexity level (simple/intermediate/advanced)
    - Setup time estimate
    - Author name
    - Template URL
    - Number of downloads/views (if available)
  `
})
```

#### Pattern 2: Category Browse

```javascript
// Available categories (examples)
const categories = [
  "Communication",
  "Data & Storage",
  "Marketing",
  "Productivity",
  "Sales & CRM",
  "Development",
  "AI & ML"
]

WebFetch({
  url: `https://n8n.io/workflows/?category=${category}`,
  prompt: "List top 10 templates in this category with descriptions and node types"
})
```

#### Pattern 3: Specific Template Details

```javascript
WebFetch({
  url: "https://n8n.io/workflows/[template-id-or-slug]",
  prompt: `
    Extract complete template information:
    - Full description and use case
    - Complete node list with versions
    - Required credentials/services
    - Setup instructions step-by-step
    - Configuration examples
    - Common issues and solutions
    - User comments and feedback
    - Alternative similar templates
  `
})
```

### Data Extraction Patterns

```javascript
// High-level overview
const overviewPrompt = `
  Extract template overview:
  - Title
  - One-sentence description
  - Primary use case
  - Difficulty level
  - Top 3 nodes used
`

// Detailed analysis
const detailPrompt = `
  Extract detailed template info:
  - Full workflow structure (nodes and connections)
  - Each node's purpose
  - Required credentials
  - Environment variables needed
  - Setup time estimate
  - Prerequisites (skills, services)
  - Common customization points
`

// Comparative analysis
const comparePrompt = `
  Compare this template with alternatives:
  - What makes it unique?
  - Advantages over alternatives
  - Disadvantages or limitations
  - Best suited for what scenarios?
  - Not suitable for what scenarios?
`
```

---

## Source 2: n8n GitHub Repository

### Overview
- **URL**: `https://github.com/n8n-io/n8n`
- **Content**: Official code, examples, documentation
- **Update Frequency**: Daily (commits)
- **Reliability**: Very High (official source)

### Search Patterns

#### Pattern 1: Node Examples

```javascript
WebFetch({
  url: "https://github.com/n8n-io/n8n/tree/master/packages/nodes-base/nodes/[NodeName]",
  prompt: `
    Find example usage for [NodeName] node:
    - Example workflow configurations
    - Common parameter combinations
    - Best practices from code
    - Edge cases handled
    - Test cases (if available)
  `
})
```

#### Pattern 2: Integration Examples

```javascript
WebFetch({
  url: "https://github.com/n8n-io/n8n/search?q=[integration]+workflow",
  prompt: `
    Find workflow examples for [integration]:
    - Repository links
    - Example workflow files (.json)
    - README documentation
    - Common patterns used
  `
})
```

#### Pattern 3: Code Search

```javascript
// Search for specific implementations
const codeSearchUrl = `https://github.com/n8n-io/n8n/search?q=${query}+language:json`

WebFetch({
  url: codeSearchUrl,
  prompt: `
    Find workflow JSON files related to: ${query}
    Extract:
    - File paths
    - Workflow names
    - Node configurations
    - Interesting patterns
  `
})
```

---

## Source 3: n8n workflows GitHub repo

### Overview
- **URL**: `https://github.com/Zie619/n8n-workflows`
- **Content**: Code samples, templates, workflows, examples
- **Update Frequency**: Variable
- **Reliability**: High (community source)

### Search Patterns

#### Pattern 1: Workflows Examples

```javascript
WebFetch({
  url: "https://github.com/Zie619/n8n-workflows/tree/main/workflows/[Category]/",
  prompt: `
    Find example usage for [Category] category:
    - Example workflow configurations
    - Common parameter combinations
    - Best practices from code
    - Edge cases handled
    - Test cases (if available)
  `
})
```

#### Pattern 2: Templates Examples

```javascript
WebFetch({
  url: "https://github.com/Zie619/n8n-workflows/tree/main/templates",
  prompt: `
    Find templates:
    - Repository links
    - Example templates
    - Example workflow files (.json)
    - README documentation
    - Common patterns used
  `
})
```

#### Pattern 3: Integration Examples

```javascript
WebFetch({
  url: "https://github.com/Zie619/n8n-workflows/search?q=[query]",
  prompt: `
    Find workflow examples or templates based on [query]:
    - Repository links
    - Example workflow files (.json)
    - Template files (.json)
    - README documentation
    - Common patterns used
  `
})
```

#### Pattern 4: Code Search

```javascript
// Search for specific implementations
const codeSearchUrl = `https://github.com/Zie619/n8n-workflows/search?q=${query}+language:json`

WebFetch({
  url: codeSearchUrl,
  prompt: `
    Find workflow JSON files related to: ${query}
    Extract:
    - File paths
    - Workflow names
    - Node configurations
    - Interesting patterns
  `
})
```

---

## Source 4: n8n Community Forum

### Overview
- **URL**: `https://community.n8n.io/`
- **Content**: User discussions, problems, solutions
- **Update Frequency**: Multiple times daily
- **Reliability**: Medium (user-generated, varying quality)

### Search Patterns

#### Pattern 1: Problem-Solution Search

```javascript
WebFetch({
  url: "https://community.n8n.io/search?q=[topic]+workflow",
  prompt: `
    Find community discussions about [topic]:
    - Problems users faced
    - Solutions that worked
    - Workflow examples shared
    - Best practices mentioned
    - Common pitfalls to avoid
  `
})
```

#### Pattern 2: Use Case Discovery

```javascript
WebFetch({
  url: "https://community.n8n.io/c/use-cases/17",
  prompt: `
    Browse use cases category:
    - Unique workflow implementations
    - Creative integration patterns
    - Real-world requirements
    - Success stories
  `
})
```

#### Pattern 3: Integration-Specific Search

```javascript
WebFetch({
  url: `https://community.n8n.io/search?q=${integration}`,
  prompt: `
    Find discussions about ${integration}:
    - How users are using it
    - Common configuration issues
    - Workarounds and tips
    - Integration best practices
  `
})
```

---

## Source 5: n8n Documentation

### Overview
- **URL**: `https://docs.n8n.io/`
- **Content**: Official docs, guides, examples
- **Update Frequency**: Weekly/monthly
- **Reliability**: Very High (official)

### Search Patterns

#### Pattern 1: Node Documentation

```javascript
WebFetch({
  url: "https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.[nodename]/",
  prompt: `
    Extract node documentation:
    - Operations available
    - Parameter descriptions
    - Example configurations
    - Authentication setup
    - Common use cases
    - Troubleshooting tips
  `
})
```

#### Pattern 2: Workflow Examples

```javascript
WebFetch({
  url: "https://docs.n8n.io/workflows/examples/",
  prompt: `
    Find workflow examples in documentation:
    - Tutorial workflows
    - Pattern demonstrations
    - Best practice examples
    - Integration guides
  `
})
```

---

## Multi-Source Search Strategies

### Strategy 1: Comprehensive Discovery

```javascript
async function comprehensiveWebSearch(query) {
  // Parallel search across top sources
  const results = await Promise.all([
    // Primary: n8n.io
    WebFetch({
      url: `https://n8n.io/workflows/?search=${query}`,
      prompt: "Find top 5 templates with descriptions and nodes"
    }),

    // Code examples: GitHub
    WebFetch({
      url: `https://github.com/n8n-io/n8n/search?q=${query}+workflow`,
      prompt: "Find workflow examples with JSON files"
    }),

    // Real usage: Forum
    WebFetch({
      url: `https://community.n8n.io/search?q=${query}`,
      prompt: "Find user discussions and solutions"
    })
  ])

  return synthesizeResults(results)
}
```

### Strategy 2: Source-Specific Deep Dive

```javascript
async function deepDiveSource(templateId, source = "n8n.io") {
  const strategies = {
    "n8n.io": async () => {
      // Get template page
      const template = await WebFetch({
        url: `https://n8n.io/workflows/${templateId}`,
        prompt: "Extract complete template details"
      })

      // Get user comments
      const feedback = await WebFetch({
        url: `https://n8n.io/workflows/${templateId}#comments`,
        prompt: "Extract user feedback, issues, tips"
      })

      return { template, feedback }
    },

    "github": async () => {
      // Find related code
      const code = await WebFetch({
        url: `https://github.com/n8n-io/n8n/search?q=${templateId}`,
        prompt: "Find related code and examples"
      })

      return { code }
    },

    "forum": async () => {
      // Find discussions
      const discussions = await WebFetch({
        url: `https://community.n8n.io/search?q=${templateId}`,
        prompt: "Find related discussions"
      })

      return { discussions }
    }
  }

  return strategies[source]()
}
```

---

## WebFetch Optimization Patterns

### Pattern 1: Progressive Detail Loading

```javascript
// Quick overview first
const overview = await WebFetch({
  url: templateUrl,
  prompt: "Extract: title, brief description, main nodes (limit to 50 words)"
})

// If promising, get details
if (overview.matchScore > 0.7) {
  const details = await WebFetch({
    url: templateUrl,
    prompt: "Extract complete details: full description, all nodes, setup instructions, configuration examples"
  })
}
```

### Pattern 2: Targeted Extraction

```javascript
// Extract only what's needed
const extractors = {
  structure: "Extract: node types, connection pattern, workflow complexity",
  setup: "Extract: prerequisites, credentials needed, setup steps",
  config: "Extract: configuration examples, parameter values, expressions used",
  issues: "Extract: common issues, troubleshooting tips, known limitations"
}

// Use appropriate extractor
const result = await WebFetch({
  url: templateUrl,
  prompt: extractors[needType]
})
```

### Pattern 3: Batch Processing

```javascript
// Process multiple URLs efficiently
async function batchWebFetch(urls, extractionPrompt) {
  // Process in batches of 3 to avoid overwhelming
  const batchSize = 3
  const results = []

  for (let i = 0; i < urls.length; i += batchSize) {
    const batch = urls.slice(i, i + batchSize)
    const batchResults = await Promise.all(
      batch.map(url => WebFetch({ url, prompt: extractionPrompt }))
    )
    results.push(...batchResults)

    // Small delay between batches
    if (i + batchSize < urls.length) {
      await delay(1000)
    }
  }

  return results
}
```

---

## Error Handling and Fallbacks

### Pattern 1: Graceful Degradation

```javascript
async function resilientWebFetch(url, prompt) {
  try {
    return await WebFetch({ url, prompt })
  } catch (error) {
    if (error.type === "timeout") {
      // Retry with simplified prompt
      return await WebFetch({
        url,
        prompt: "Extract only: title, description, main components"
      })
    }

    if (error.type === "not_found") {
      // Try alternative URL
      const altUrl = findAlternativeUrl(url)
      if (altUrl) {
        return await WebFetch({ url: altUrl, prompt })
      }
    }

    // Final fallback: return partial data
    return {
      status: "partial",
      error: error.message,
      source: url
    }
  }
}
```

### Pattern 2: Source Fallback Chain

```javascript
async function fallbackSearch(query) {
  const sources = [
    { name: "n8n.io", url: `https://n8n.io/workflows/?search=${query}` },
    { name: "github", url: `https://github.com/n8n-io/n8n/search?q=${query}` },
    { name: "forum", url: `https://community.n8n.io/search?q=${query}` }
  ]

  for (const source of sources) {
    try {
      const result = await WebFetch({
        url: source.url,
        prompt: "Find relevant templates or examples"
      })

      if (result && result.length > 0) {
        return { source: source.name, result }
      }
    } catch (error) {
      console.log(`${source.name} failed, trying next...`)
      continue
    }
  }

  return { status: "no_results_found" }
}
```

---

## Best Practices

### ✅ Do

- **Start with n8n.io** - Most reliable and current
- **Use specific prompts** - Better extraction quality
- **Handle timeouts gracefully** - Have fallback strategies
- **Cache results** - Avoid redundant fetches (30 min cache)
- **Batch when possible** - Process multiple URLs together
- **Progressive loading** - Overview first, details if needed
- **Validate extracted data** - Check for completeness

### ❌ Don't

- **Bombard sources** - Respect rate limits
- **Use generic prompts** - "Extract everything" is inefficient
- **Ignore errors** - Always handle failures
- **Fetch duplicates** - Check cache first
- **Process too many at once** - Limit concurrent fetches
- **Trust all forum content** - Validate quality
- **Forget mobile URLs** - Some templates have mobile-specific pages

---

## Source-Specific Tips

### n8n.io/workflows
- **Sort options**: newest, popular, trending
- **Filter by**: category, complexity, setup time
- **Template IDs**: Usually 4-5 digits
- **URL patterns**: `/workflows/[id]` or `/workflows/[slug]-[id]`

### GitHub
- **Search syntax**: Use `language:json` for workflow files
- **File locations**: Usually in `packages/nodes-base/nodes/`
- **Branch**: Check `master` for stable, `beta` for latest
- **Examples**: Look for `.test.ts` files for usage examples

### Community Forum
- **Categories**: Browse by category for curated content
- **Tags**: Use tags like `#workflow`, `#automation`, `#integration`
- **User reputation**: Check user badges for credibility
- **Solved topics**: Filter for solutions (✓ marked)

---

## Performance Metrics

| Source | Avg Response Time | Success Rate | Data Quality |
|--------|------------------|--------------|--------------|
| n8n.io | 2-5s | 95% | Very High |
| GitHub | 3-7s | 90% | High |
| Forum | 3-7s | 85% | Medium-High |
| Docs | 2-4s | 98% | Very High |

**Optimization**: Prioritize by success rate and quality for best results.

---

## Summary

**Key Points**:
1. **n8n.io is primary** - Most reliable web source
2. **GitHub for code** - Best for implementation details
3. **Forum for real usage** - Real-world patterns and issues
4. **Docs for official** - Authoritative information
5. **Always handle errors** - Web can be unreliable

**Common Pattern**:
```
1. n8n.io (quick template match)
2. If insufficient → GitHub (code examples)
3. If complex → Forum (real usage patterns)
4. Always → Docs (validate approach)
```

**Related Files**:
- [SKILL.md](SKILL.md) - Complete skill specification
- [SEARCH_STRATEGIES.md](SEARCH_STRATEGIES.md) - Advanced search patterns
- [README.md](README.md) - Quick reference guide
