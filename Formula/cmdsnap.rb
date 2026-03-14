class Cmdsnap < Formula
  desc "Capture terminal commands and their output for easy sharing"
  homepage "https://github.com/marioschiras/cmdsnap"
  url "https://github.com/marioschiras/cmdsnap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3fb55e057658c49510772aa9515e6ad8f5a0ff290eb4e3b8f1ba3e727464a075"
  license "MIT"

  def install
    # Install the main zsh integration
    share.install "integrations/zsh.cmdsnap.zsh"
    
    # Create a wrapper script that sources the zsh file
    (bin/"cmdsnap").write <<~EOS
      #!/bin/zsh
      source "#{share}/zsh.cmdsnap.zsh"
      cmdsnap "$@"
    EOS
  end

  def caveats
    <<~EOS
      To enable cmdsnap in your shell, add this to your ~/.zshrc:

        source $(brew --prefix)/share/zsh.cmdsnap.zsh

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    assert_match "cmdsnap", shell_output("#{bin}/cmdsnap help")
  end
end
