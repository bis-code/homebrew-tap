class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.3.8/claw-1.3.8.tar.gz"
  sha256 "9e186ff9f7c5e06c30ce2a3792d6d9e9c74fea9343c2dff15c9aeb4c9e847161"
  license "MIT"
  version "1.3.8"

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

      New in 1.3.8: Auto-indexes projects for semantic search on first run!
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
