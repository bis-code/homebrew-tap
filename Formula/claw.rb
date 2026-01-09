class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.4.0/claw-1.4.0.tar.gz"
  sha256 "99ad07e066fecab3279647a6fef6ccf90adde7b5388f69da0bd7c37f8abc5949"
  license "MIT"
  version "1.4.0"

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
        claw --help       - Show all options

      New in 1.4.0: Autonomous Self-Improvement! 🤖
        - Daily automated code quality improvements
        - Web research for best practices and trends
        - Automatic PR creation with improvements

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
