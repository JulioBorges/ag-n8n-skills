# Advanced Template Search Strategies

Comprehensive guide to template discovery patterns and optimization techniques.

---

## Search Strategy Framework

### Strategy Selection Matrix

| User Need Type | Primary Strategy | Fallback | Expected Results |
|----------------|-----------------|----------|------------------|
| Known use case | Keyword search | Node search | 5-15 templates |
| Specific nodes | Node-based | Task-based | 3-10 templates |
| Pattern type | Task-based | Pattern skill | Template or pattern |
| Learning | Keyword + Web | Examples | Multiple sources |
| Recent trends | Web first | MCP keyword | Current templates |

---

## Multi-Stage Search Patterns

### Pattern 1: Funnel Search (Broad → Narrow)

**Use when**: Starting with vague requirements

```javascript
// Stage 1: Broad keyword search
let results = search_templates({
  query: "data processing"
})
// → 150 results

// Stage 2: Add context
results = search_templates({
  query: "data processing api webhook"
})
// → 45 results

// Stage 3: Filter by complexity
results = search_templates({
  searchMode: "by_metadata",
  complexity: "simple",
  query: "data processing api webhook"
})
// → 12 results

// Stage 4: Node-specific (if needed)
results = search_templates({
  searchMode: "by_nodes",
  nodeTypes: ["n8n-nodes-base.webhook", "n8n-nodes-base.httpRequest"]
})
// → 5 results (optimal)
```

### Pattern 2: Parallel Search (Multiple Angles)

**Use when**: Complex requirements with multiple dimensions

```javascript
// Execute searches in parallel
const searches = await Promise.all([
  // By keyword
  search_templates({query: "payment processing stripe"}),

  // By nodes
  search_templates({
    searchMode: "by_nodes",
    nodeTypes: ["n8n-nodes-base.stripe", "n8n-nodes-base.webhook"]
  }),

  // By task type
  search_templates({
    searchMode: "by_task",
    task: "webhook_processing"
  }),

  // Web search
  WebFetch({
    url: "https://n8n.io/workflows/?search=stripe+payment",
    prompt: "Find Stripe payment processing templates"
  })
])

// Correlate results
const unique = deduplicateResults(searches)
const ranked = rankByRelevance(unique, userIntent)
return ranked.slice(0, 5)  // Top 5
```

### Pattern 3: Iterative Refinement

**Use when**: Initial search yields suboptimal results

```javascript
// Iteration 1: Initial search
let results = search_templates({query: "email automation"})
let quality = assessQuality(results, userRequirements)

// Iteration 2: Refine based on gaps
if (quality.score < 0.7) {
  results = search_templates({
    searchMode: "by_nodes",
    nodeTypes: extractRequiredNodes(userRequirements)
  })
  quality = assessQuality(results, userRequirements)
}

// Iteration 3: Web supplement
if (quality.score < 0.8) {
  const webResults = WebFetch({
    url: "https://n8n.io/workflows/?search=" + refineQuery(userRequirements),
    prompt: "Find templates matching: " + userRequirements
  })
  results = mergeResults(results, webResults)
}

// Iteration 4: Fall back to patterns if still insufficient
if (quality.score < 0.6) {
  return {
    status: "no_suitable_template",
    recommendation: "build_from_pattern",
    suggestedPattern: identifyPattern(userRequirements)
  }
}
```

---

## Query Optimization Techniques

### Technique 1: Semantic Expansion

**Transform user query into search-optimized terms**

```javascript
// User query: "I want to sync data between systems"

// Semantic expansion
const expandedTerms = {
  "sync": ["sync", "synchronize", "update", "transfer", "copy"],
  "data": ["data", "records", "information", "items"],
  "systems": ["database", "api", "service", "application"]
}

// Generate search variants
const queries = generateSearchVariants(expandedTerms)
// → ["sync database api", "transfer records service", "update data application"]

// Execute best performing variant
```

### Technique 2: Node Inference

**Extract implied nodes from user description**

```javascript
// User query: "Send Slack notifications when GitHub issues are created"

// Infer nodes
const inferredNodes = {
  trigger: "n8n-nodes-base.githubTrigger",  // "GitHub issues created"
  transformation: "n8n-nodes-base.set",      // Implicit
  action: "n8n-nodes-base.slack"             // "Send Slack notifications"
}

// Search by inferred nodes
search_templates({
  searchMode: "by_nodes",
  nodeTypes: Object.values(inferredNodes)
})
```

### Technique 3: Task Pattern Recognition

**Identify workflow pattern from description**

```javascript
// User query patterns → Task types

const taskPatterns = {
  "webhook_processing": [
    /receive.*webhook/i,
    /form submission/i,
    /http.*post/i
  ],
  "scheduled_task": [
    /every (hour|day|week)/i,
    /scheduled/i,
    /recurring/i,
    /daily report/i
  ],
  "http_api_integration": [
    /fetch.*api/i,
    /rest api/i,
    /get.*data.*from/i
  ],
  "database_operations": [
    /database/i,
    /postgres|mysql|mongodb/i,
    /query.*data/i
  ],
  "ai_agent_workflow": [
    /chatbot/i,
    /ai.*agent/i,
    /language model/i
  ]
}

// Match and search by task
const matchedTask = matchPatterns(userQuery, taskPatterns)
if (matchedTask) {
  search_templates({
    searchMode: "by_task",
    task: matchedTask
  })
}
```

---

## Source Correlation Strategies

### Strategy 1: Cross-Reference Validation

**Validate template quality across sources**

```javascript
// Step 1: Find template in MCP
const mcpTemplate = search_templates({query: "topic"})

// Step 2: Find same template on web (by ID or name)
const webTemplate = WebFetch({
  url: `https://n8n.io/workflows/${mcpTemplate.id}`,
  prompt: "Extract: user ratings, comments, last updated, author reputation"
})

// Step 3: Check community discussions
const communityDiscussion = WebFetch({
  url: `https://community.n8n.io/search?q=${mcpTemplate.name}`,
  prompt: "Find: issues reported, praise, modifications suggested"
})

// Step 4: Quality score
const qualityScore = {
  technical: mcpTemplate.validationScore,
  community: webTemplate.rating,
  maturity: communityDiscussion.discussionCount
}

// Decision
if (qualityScore.overall > 0.8) {
  return "recommend_deployment"
} else if (qualityScore.overall > 0.6) {
  return "recommend_with_caution"
} else {
  return "use_as_reference_only"
}
```

### Strategy 2: Complementary Source Mining

**Use each source for its strength**

```javascript
const comprehensiveSearch = {
  // MCP: Fast structure search
  structure: search_templates({
    searchMode: "by_nodes",
    nodeTypes: requiredNodes
  }),

  // n8n.io: Recent and trending
  trending: WebFetch({
    url: "https://n8n.io/workflows/?sort=recent",
    prompt: "Find recent templates for [topic]"
  }),

  // GitHub: Code examples and patterns
  codeExamples: WebFetch({
    url: "https://github.com/n8n-io/n8n/tree/master/packages/nodes-base/nodes",
    prompt: "Find example usage patterns for [node]"
  }),

  // Forum: Real-world usage and issues
  realWorld: WebFetch({
    url: "https://community.n8n.io/search?q=[topic]",
    prompt: "Find: common issues, best practices, user experiences"
  })
}

// Synthesize
return synthesizeMultiSourceResults(comprehensiveSearch)
```

---

## Result Ranking Algorithms

### Algorithm 1: Relevance Scoring

```javascript
function calculateRelevanceScore(template, userRequirements) {
  const scores = {
    nodeMatch: scoreNodeMatch(template.nodes, userRequirements.nodes),
    keywordMatch: scoreKeywordMatch(template.description, userRequirements.keywords),
    complexity: scoreComplexity(template.complexity, userRequirements.complexity),
    setupTime: scoreSetupTime(template.setupMinutes, userRequirements.maxSetupTime),
    quality: template.validationScore || 0.5
  }

  // Weighted average
  const weights = {
    nodeMatch: 0.35,
    keywordMatch: 0.25,
    complexity: 0.15,
    setupTime: 0.10,
    quality: 0.15
  }

  return Object.entries(scores).reduce((total, [key, score]) => {
    return total + (score * weights[key])
  }, 0)
}
```

### Algorithm 2: Multi-Factor Ranking

```javascript
function rankTemplates(templates, context) {
  return templates.map(template => {
    const factors = {
      relevance: calculateRelevance(template, context.query),
      quality: assessQuality(template),
      popularity: template.downloads || 0,
      recency: getRecencyScore(template.lastUpdated),
      completeness: assessCompleteness(template),
      customizability: assessCustomizability(template, context.requirements)
    }

    // Context-aware weighting
    const weights = determineWeights(context)

    template.score = Object.entries(factors).reduce((total, [key, value]) => {
      return total + (value * weights[key])
    }, 0)

    return template
  })
  .sort((a, b) => b.score - a.score)
}
```

---

## Search Optimization Patterns

### Pattern 1: Cache-Aware Search

```javascript
// Check cache before expensive operations
const cacheKey = generateCacheKey(searchParams)

if (cache.has(cacheKey) && !cache.isExpired(cacheKey)) {
  return cache.get(cacheKey)
}

// If not cached, perform search
const results = await performSearch(searchParams)

// Cache results (1 hour for MCP, 30 min for web)
cache.set(cacheKey, results, getCacheDuration(searchParams.source))

return results
```

### Pattern 2: Progressive Loading

```javascript
// Quick results first, comprehensive later
async function progressiveSearch(query) {
  // Phase 1: Fast MCP search (< 50ms)
  const quickResults = await search_templates({
    query: query,
    limit: 5
  })

  // Return immediately for display
  yield { phase: "quick", results: quickResults }

  // Phase 2: Comprehensive MCP search (< 200ms)
  const comprehensiveResults = await Promise.all([
    search_templates({searchMode: "by_nodes"}),
    search_templates({searchMode: "by_task"})
  ])

  yield { phase: "comprehensive", results: comprehensiveResults }

  // Phase 3: Web search (2-5s) - only if requested
  if (needsWebSearch(quickResults, comprehensiveResults)) {
    const webResults = await searchWebSources(query)
    yield { phase: "web", results: webResults }
  }
}
```

### Pattern 3: Adaptive Strategy Selection

```javascript
function selectSearchStrategy(userQuery, context) {
  // Analyze query characteristics
  const characteristics = analyzeQuery(userQuery)

  if (characteristics.hasSpecificNodes) {
    return "node_based_search"
  }

  if (characteristics.isTaskPattern) {
    return "task_based_search"
  }

  if (characteristics.isComplex && characteristics.isVague) {
    return "iterative_refinement"
  }

  if (context.requiresRecent) {
    return "web_first_search"
  }

  if (characteristics.isCommon) {
    return "simple_keyword_search"
  }

  // Default: multi-angle parallel search
  return "parallel_comprehensive_search"
}
```

---

## Failure Handling Strategies

### Strategy 1: Graceful Degradation

```javascript
async function resilientSearch(query) {
  try {
    // Try optimal strategy
    return await optimalSearch(query)
  } catch (error) {
    try {
      // Fall back to simpler search
      return await simpleKeywordSearch(query)
    } catch (error2) {
      // Fall back to pattern recommendation
      return {
        status: "search_failed",
        fallback: "pattern_recommendation",
        suggestedPattern: inferPatternFromQuery(query)
      }
    }
  }
}
```

### Strategy 2: Result Augmentation

```javascript
// When results are insufficient, augment with related content
function augmentResults(results, query) {
  if (results.length < 3) {
    // Add similar templates
    const similar = findSimilarTemplates(results, {
      similarity: 0.7,
      maxResults: 5
    })

    // Add partial matches
    const partial = search_templates({
      query: extractKeywords(query),
      minMatch: 0.5
    })

    // Add pattern suggestions
    const patterns = {
      type: "pattern_suggestions",
      patterns: identifyRelevantPatterns(query)
    }

    return {
      exact: results,
      similar: similar,
      partial: partial,
      patterns: patterns
    }
  }

  return results
}
```

---

## Performance Optimization

### Optimization 1: Parallel Execution

```javascript
// Execute independent searches in parallel
async function optimizedSearch(query) {
  const [mcp, web, github] = await Promise.all([
    searchMCP(query),
    searchWeb(query).catch(() => []),  // Don't fail if web unavailable
    searchGitHub(query).catch(() => [])
  ])

  return mergeAndRank([...mcp, ...web, ...github])
}
```

### Optimization 2: Early Termination

```javascript
// Stop searching when good enough results found
async function earlyTerminationSearch(query, threshold = 0.8) {
  // Quick search
  const quick = await quickSearch(query)
  const quickScore = assessResultQuality(quick)

  if (quickScore >= threshold) {
    return quick  // Good enough, stop here
  }

  // Comprehensive search
  const comprehensive = await comprehensiveSearch(query)
  const comprehensiveScore = assessResultQuality(comprehensive)

  if (comprehensiveScore >= threshold) {
    return comprehensive  // Good enough, stop here
  }

  // Web search (expensive)
  const web = await webSearch(query)
  return web
}
```

---

## Advanced Filtering

### Filter 1: Smart Complexity Matching

```javascript
// Match user skill level to template complexity
function filterByComplexity(templates, userProfile) {
  const userLevel = determineSkillLevel(userProfile)

  const complexityMap = {
    beginner: ["simple"],
    intermediate: ["simple", "intermediate"],
    advanced: ["simple", "intermediate", "advanced"]
  }

  return templates.filter(t =>
    complexityMap[userLevel].includes(t.complexity)
  )
}
```

### Filter 2: Credential Availability

```javascript
// Filter by available credentials
function filterByAvailableCredentials(templates, userCredentials) {
  return templates.map(template => {
    const requiredCreds = extractRequiredCredentials(template)
    const available = requiredCreds.filter(cred =>
      userCredentials.includes(cred)
    )

    template.credentialCoverage = available.length / requiredCreds.length
    template.missingCredentials = requiredCreds.filter(cred =>
      !userCredentials.includes(cred)
    )

    return template
  })
  .sort((a, b) => b.credentialCoverage - a.credentialCoverage)
}
```

---

## Summary

**Key Strategy Principles**:
1. **Start Fast** - MCP first (< 50ms), web only if needed
2. **Adapt** - Choose strategy based on query characteristics
3. **Parallel** - Execute independent searches concurrently
4. **Refine** - Iterate based on result quality
5. **Fallback** - Always have degradation path

**Common Patterns**:
- Funnel: Broad → Narrow
- Parallel: Multiple angles simultaneously
- Iterative: Refine based on feedback
- Adaptive: Choose strategy dynamically

**Performance Targets**:
- Quick search: < 100ms
- Comprehensive: < 500ms
- With web: < 5s
- Quality threshold: > 0.8 relevance score
