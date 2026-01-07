class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.3.5/claw-1.3.5.tar.gz"
  sha256 "7e3bc91f75151977697e7485626dd5d519215df5051ffa4bc3c6c6f55f571122"
  license "MIT"
  version "1.3.5"

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
        claw repos add    - Track a repository
        claw templates    - Manage GitHub issue templates
        claw --help       - Show all options
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
