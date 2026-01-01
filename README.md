# Homebrew Tap

Custom Homebrew formulas.

## Installation

```bash
brew tap yourusername/tap
```

## Available Formulas

### claude-code-setup

CLI tool to install and manage Claude Code configurations across repositories.

```bash
brew install claude-code-setup
```

## Updating the tap

After creating a new release of claude-code-setup:

1. Create a GitHub release with a tag (e.g., `v0.1.0`)
2. Get the tarball URL: `https://github.com/yourusername/claude-code-setup/archive/refs/tags/v0.1.0.tar.gz`
3. Calculate SHA256: `curl -sL <url> | shasum -a 256`
4. Update `Formula/claude-code-setup.rb` with new version, URL, and SHA256
5. Push to this repo
