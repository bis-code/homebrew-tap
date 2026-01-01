# frozen_string_literal: true

# Homebrew formula for claude-code-setup
# A CLI tool to manage Claude Code configurations
#
# To install:
#   brew tap yourusername/tap
#   brew install claude-code-setup
#
class ClaudeCodeSetup < Formula
  desc "CLI tool to install and manage Claude Code configurations"
  homepage "https://github.com/bis-code/claude-code-setup"
  url "https://github.com/bis-code/claude-code-setup/releases/download/v0.1.0/claude-code-setup-0.1.0.tar.gz"
  sha256 "a116211886de288f8450704300ae0bcf179f0699d3aa467bc1e877ae9810560e"
  license "MIT"
  version "0.1.0"

  # No dependencies - pure bash

  def install
    # Install the main executable
    bin.install "bin/claude-setup"

    # Install library files
    (lib/"claude-setup").install Dir["lib/*"]

    # Install templates directory (includes .claude subdirectory)
    (lib/"claude-setup").install "templates"

    # Update the LIB_DIR path in the main script
    inreplace bin/"claude-setup",
      'LIB_DIR="${SCRIPT_DIR}/../lib"',
      "LIB_DIR=\"#{lib}/claude-setup\""
  end

  def caveats
    <<~EOS
      To get started:
        cd your-project
        claude-setup init

      To check for updates:
        claude-setup check

      For more info:
        claude-setup --help
    EOS
  end

  test do
    assert_match "claude-setup", shell_output("#{bin}/claude-setup --help")
  end
end
