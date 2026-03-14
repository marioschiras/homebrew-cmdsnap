# Homebrew Tap for cmdsnap

This is the official Homebrew tap for [cmdsnap](https://github.com/marioschiras/cmdsnap).

## Installation

```bash
brew install marioschiras/cmdsnap/cmdsnap
```

Or:

```bash
brew tap marioschiras/cmdsnap
brew install cmdsnap
```

## After Installation

Add this to your `~/.zshrc`:

```bash
source $(brew --prefix)/share/zsh.cmdsnap.zsh
```

Then restart your terminal or run `source ~/.zshrc`.

## Usage

```bash
cmdsnap            # Capture the last command
cmdsnap 3          # Capture the last 3 commands
cmdsnap list       # Show recent commands
cmdsnap @2         # Capture specific command #2
```

See the [main repository](https://github.com/marioschiras/cmdsnap) for full documentation.
