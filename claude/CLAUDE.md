This element documents some elements of my codestyle
that I'd like to preserve when coding with agents.

# General

- Prefer clarity over cleverness
- Keep code boring and explicit
- Avoid abstractions unless they remove real duplication (rule of 3)
- No speculative generalization

### TODOs

Each TODO must refer to my username on GitHub.
Example:

```
// TODO(bartekpacia): <todo content>
```

Some projects may have more precise conventions for TODOs - repsect them.

### Semantic Line Breaks

Follow [Semantic Line Breaks](https://sembr.org) spec for Markdown and code docs.

### LLM usage disclosure

When asked to create a GitHub issue, prepend with tool name + model name:

```md
> [!NOTE]
> Created with Claude Code / Opus 4.6
```

# Language-specific

## Go

### Alternative tools

Formatting: `gofumpt`
Linting: `staticcheck`
Testing: `gotestsum`

### Error wrapping

In Go, prefer `%w` over `%v` in `fmt.Errorf`:

- `%v` — formats the error as a string.
  The original error is lost (unwrapping won't find it).

- `%w` — wraps the error.
  The original error is preserved and can be found with `errors.Is()` and `errors.As()`

Default to `%w`.
Only use `%v` when you're at an abstraction boundary
and deliberately don't want the caller to depend on the inner error type.
