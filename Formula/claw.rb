class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.3.9/claw-1.3.9.tar.gz"
  sha256 "4ab83761968a35c78540315170e45273d97f24b21fc7c99f86d58fa393527eb9"
  license "MIT"
  version "1.3.9"

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

      New in 1.3.9: Installs full Claude config (skills, rules, agents, etc.)!
      Run 'claw --update' to refresh your Claude setup.
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
