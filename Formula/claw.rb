class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.4.1/claw-1.4.1.tar.gz"
  sha256 "0895619885e3aa59e03eb858f771ec8000bcce0a287184429dc20513c452b192"
  license "MIT"
  version "1.4.1"

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
      Claw is now installed as a Claude Code wrapper.

      Usage:
        claw              - Start Claude Code with enhanced features
        claw --yolo       - Skip permission prompts (dangerous!)
        claw project      - Multi-repo project management
        claw templates    - Manage GitHub issue templates
        claw --help       - Show all options (including available skills!)

      New in 1.4.1: 📚 Better Documentation
        - All skills/commands now documented with flags
        - See 'claw --help' for quick reference
        - Inside Claude: use /help to see all commands

      Autonomous Self-Improvement (v1.4.0): 🤖
        - Daily automated code quality improvements
        - Web research for best practices and trends
        - Automatic PR creation

        Setup: claw project generate-self-improve-workflow

        For each repo, first run:
          claude
          /install-github-app
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
