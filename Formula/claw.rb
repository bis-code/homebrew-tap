# frozen_string_literal: true

# Homebrew formula for claw
# Claude Automated Workflow - CLI tool to manage Claude Code configurations
#
# To install:
#   brew tap bis-code/tap
#   brew install claw
#
class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claude-code-setup"
  url "https://github.com/bis-code/claude-code-setup/releases/download/v0.4.0/claw-0.4.0.tar.gz"
  sha256 "31d95a2eebdf9104b8d109ff95abb638a8fce887436555c83b34a98417e065b0"
  license "MIT"
  version "0.4.0"

  def install
    bin.install "bin/claw"
    (lib/"claw").install Dir["lib/*"]
    (lib/"claw").install "templates"

    inreplace bin/"claw",
      'LIB_DIR="${SCRIPT_DIR}/../lib"',
      "LIB_DIR=\"#{lib}/claw\""
  end

  def caveats
    <<~EOS
      To get started:
        cd your-project
        claw init

      Available commands:
        claw detect      - Detect project type
        claw agents      - Manage AI agents
        claw leann       - LEANN semantic search
        claw help        - Show all commands
    EOS
  end

  test do
    system "#{bin}/claw", "version"
    system "#{bin}/claw", "help"
  end
end