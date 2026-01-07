class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.3.4/claw-1.3.4.tar.gz"
  sha256 "9360981f955b386747659c976651e6c8a5576aefbfad3e3cc8691a3cc7dbbbd4"
  license "MIT"
  version "1.3.4"

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
