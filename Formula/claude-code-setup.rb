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
  url "https://github.com/bis-code/claude-code-setup/releases/download/v0.3.6/claude-code-setup-0.3.6.tar.gz"
  sha256 "1ec8fd59c2b0eda60e46612c14d9891e290a470781b30770056e61015cc5c8bb"
  license "MIT"
  version "0.3.6"

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
