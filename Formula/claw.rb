class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.3.7/claw-1.3.7.tar.gz"
  sha256 "65afb8799e07c90c909961341a389ee51615f93970cfc1694eb9248a61c2bc2e"
  license "MIT"
  version "1.3.7"

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
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
