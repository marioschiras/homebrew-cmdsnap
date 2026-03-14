class Cmdsnap < Formula
  desc "Capture terminal commands and their output for easy sharing"
  homepage "https://github.com/marioschiras/cmdsnap"
  url "https://github.com/marioschiras/cmdsnap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3fb55e057658c49510772aa9515e6ad8f5a0ff290eb4e3b8f1ba3e727464a075"
  license "MIT"

  def install
    share.install "integrations/zsh.cmdsnap.zsh"
    
    # Create a setup helper instead of a broken wrapper
    (bin/"cmdsnap-setup").write <<~EOS
      #!/bin/zsh
      SOURCE_LINE='source $(brew --prefix)/share/zsh.cmdsnap.zsh'
      
      if grep -q "zsh.cmdsnap.zsh" ~/.zshrc 2>/dev/null; then
        echo "✓ cmdsnap is already in your .zshrc"
      else
        echo "" >> ~/.zshrc
        echo "# cmdsnap - terminal command capture" >> ~/.zshrc
        echo "$SOURCE_LINE" >> ~/.zshrc
        echo "✓ Added cmdsnap to ~/.zshrc"
      fi
      
      echo ""
      echo "Run this to start using cmdsnap now:"
      echo "  source ~/.zshrc"
      echo ""
      echo "Or restart your terminal."
    EOS
  end

  def caveats
    <<~EOS
      To complete installation, run:

        cmdsnap-setup

      Or manually add this to your ~/.zshrc:

        source $(brew --prefix)/share/zsh.cmdsnap.zsh

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    assert_predicate share/"zsh.cmdsnap.zsh", :exist?
  end
end
