# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **n8n-template-search skill** - Comprehensive template discovery from multiple sources
  - MCP template library search (2,709+ templates)
  - Web-based template discovery (n8n.io, GitHub, Community Forum)
  - Advanced search strategies (keyword, node-based, task-based, metadata)
  - Multi-source correlation and ranking
  - Progressive refinement and adaptive search
  - Documentation: SKILL.md, README.md, SEARCH_STRATEGIES.md, WEB_SOURCES.md

- **Multi-platform support documentation** - Complete compatibility guide
  - COMPATIBILITY.md with detailed setup for 7+ AI assistants
  - Platform-specific usage examples and best practices
  - Troubleshooting section for each platform
  - Feature comparison matrix across platforms
  - MCP tools configuration by platform

- **Automatic conversion script** - One-command multi-platform support
  - `scripts/convert-to-rules.sh` for automatic format conversion
  - Generates 5 platform-specific files from `.agent/` folder
  - Creates: `.cursorrules`, `.windsurfrules`, `.clinerules`, `.continuerc.json`, `AIDER_USAGE.md`
  - Safe to run multiple times (idempotent)
  - Preserves original `.agent/` structure

### Enhanced
- **n8n-automation-expert agent** - Improved with skill integration directives
  - Added "Skill Integration Strategy" section with decision tree
  - Added "When to Load Sub-Skills" reference table
  - Added "Reasoning Pattern with Skills" workflow guide
  - Added "Sub-Skill Reference" with quick loading commands
  - Enhanced decision-making with skill usage examples

- **n8n-automation master skill** - Updated to orchestrate 8 skills (was 7)
  - Added n8n-template-search to sub-skills table
  - Enhanced workflow creation process with template search as Step 0
  - Added template search to quick reference section
  - Updated skill count from 7 to 8 throughout documentation

- **README.md** - Comprehensive multi-platform documentation
  - Platform-specific quick start sections (6 platforms)
  - Visual conversion flow diagram
  - Decision tree for platform selection
  - Verification steps after installation
  - Platform comparison table
  - Rules conversion explanation with examples

- **COMPATIBILITY.md** - In-depth compatibility guide
  - Quick start section (3 simple steps)
  - Detailed setup for each platform (7 assistants)
  - Explanation of what each converted file does
  - Practical examples by platform
  - Conversion process details
  - When to re-run conversion

### Improved
- Template discovery workflow now emphasizes searching first before building
- Agent now has clear guidelines on when and how to load specific sub-skills
- Better integration between skills with explicit transition points
- Enhanced documentation with decision trees and reasoning patterns
- Multi-platform support is now clearly documented and easy to set up
- Users can choose their preferred AI assistant without limitation

### Documentation
- Updated README.md with multi-platform support and conversion guide
- Created COMPATIBILITY.md (comprehensive, 500+ lines)
- Created conversion script with inline documentation
- Added platform-specific usage examples for 6+ assistants
- Added visual flow diagrams and decision trees
- Created format comparison tables
- Enhanced agent documentation with skill loading patterns

## [1.0.0] - Initial Release

### Added
- n8n-automation-expert agent
- 7 specialized n8n skills:
  - n8n-automation (master skill)
  - n8n-mcp-tools-expert
  - n8n-workflow-patterns
  - n8n-expression-syntax
  - n8n-validation-expert
  - n8n-node-configuration
  - n8n-code-javascript
  - n8n-code-python
- CLI installation tool
- Comprehensive documentation
- MCP integration support

---

## Migration Guide

### For Existing Users

If you have already installed `ag-n8n-skills`, update to get the new template search functionality:

```bash
# Update to latest version
ag-n8n-skills update

# Or reinstall if needed
ag-n8n-skills init --force
```

### What Changed

1. **New Skill Available**: `n8n-template-search` is now available for comprehensive template discovery
2. **Enhanced Agent**: The `n8n-automation-expert` agent now has better skill integration directives
3. **Workflow Changes**: Template search is now Step 0 (before node discovery) in the workflow creation process

### Breaking Changes

None. This is a backward-compatible enhancement.

### New Capabilities

```javascript
// Before: Only MCP template search
search_templates({query: "webhook slack"})

// Now: Multi-source template discovery
// 1. MCP search (fast)
search_templates({query: "webhook slack"})

// 2. Web search (comprehensive) - Load n8n-template-search skill
WebFetch({
  url: "https://n8n.io/workflows/?search=webhook+slack",
  prompt: "Find templates with descriptions and setup guides"
})

// 3. GitHub examples
WebFetch({
  url: "https://github.com/n8n-io/n8n/search?q=webhook+slack+workflow",
  prompt: "Find example workflow implementations"
})

// 4. Community forum
WebFetch({
  url: "https://community.n8n.io/search?q=webhook+slack",
  prompt: "Find real-world usage patterns and discussions"
})
```

---

## Roadmap

### Planned Features

- [ ] Template recommendation system based on user preferences
- [ ] Template quality scoring and ranking improvements
- [ ] Integration with more template sources
- [ ] Template caching for faster repeated searches
- [ ] Template comparison tool
- [ ] Custom template repository support
- [ ] Template usage analytics and insights

### Future Skills

- [ ] n8n-performance-optimization - Performance tuning and optimization
- [ ] n8n-security-best-practices - Security auditing and hardening
- [ ] n8n-testing-expert - Workflow testing and quality assurance
- [ ] n8n-deployment-automation - CI/CD and deployment strategies

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this project.

## Credits

### Template Search Enhancement
- Designed and implemented by Julio Borges
- Inspired by the n8n community's need for better template discovery

### Original Project
Based on concept by Romuald Członkowski - [www.aiadvisors.pl/en](https://www.aiadvisors.pl/en)
- [n8n-mcp](https://github.com/czlonkowski/n8n-mcp)
- [n8n-skills](https://github.com/czlonkowski/n8n-skills)

Adapted by Julio Borges - [www.julioborges.net.br](https://julioborges.net.br)

---

## License

MIT © [Julio Borges](https://github.com/julioborges)
