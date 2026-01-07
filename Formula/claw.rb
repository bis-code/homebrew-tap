class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claw"
  url "https://github.com/bis-code/claw/releases/download/v1.0.1/claw-1.0.1.tar.gz"
  sha256 "bebcae7a3d6f7577cd6d7f4adc5d9d291993d5631cafcfa85d1606818022f9bc"
  license "MIT"
  version "1.0.1"

  def install
    bin.install "bin/claw"
    (lib/"claw").install Dir["lib/*"]
    (lib/"claw").install "templates"

    inreplace bin/"claw",
      'LIB_DIR="${SCRIPT_DIR}/../lib"',
      "LIB_DIR=\"#{lib}/claw\""

    inreplace bin/"claw",
      'TEMPLATES_DIR="${SCRIPT_DIR}/../templates"',
      "TEMPLATES_DIR=\"#{lib}/claw/templates\""
  end

  def caveats
    <<~EOS
      Claw is now installed as a Claude Code wrapper.

      Usage:
        claw              - Start Claude Code with enhanced features
        claw repos add    - Track a repository
        claw issues       - View issues from tracked repos
        claw --help       - Show all options
    EOS
  end

  test do
    system "#{bin}/claw", "--version"
    system "#{bin}/claw", "--help"
  end
end
