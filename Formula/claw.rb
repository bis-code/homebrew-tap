class Claw < Formula
  desc "Claude Automated Workflow - CLI tool for Claude Code configurations"
  homepage "https://github.com/bis-code/claude-code-setup"
  url "https://github.com/bis-code/claude-code-setup/releases/download/v0.4.3/claw-0.4.3.tar.gz"
  sha256 "c294a5534d2d1b763ced8e0b6aff09bf6b730fcae5568b6cf88caadfda53532c"
  license "MIT"
  version "0.4.3"

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