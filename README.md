# Config Files

## Installation

First you need to checkout the config files repo and place it in your home directory with the correct directory name,
remember to prefix the repo name with a dot, `.config-files`.

```bash
git clone https://github.com/faylite/config-files.git ~/.config-files
```

The setup scripts *must* be run from your home directory. So after you change to your home directory, run the required setup script.
Please make a backup of your configuration files before running these scripts *as they will overwrite everything*.

```bash
# Linux
.config-files/setup/linux.sh

# Mac
.config-files/setup/mac.sh
```

## Overview

> File structure

- configs
  - Generic dot files and configurations.
- apps
  - Other application related configurations, themes, etc.
- env
  - Environment files used to enable/disable options provided by these config files.
- scripts
  - Scripts used by applications, shell configurations and aliases.
- setup
  - Setup scripts used to install setup new machines with these config files.
- README.md
  - See [README.md](README)

## Options

The config files has several options available, these options are set in the environment files located in the env directory.

> See `env/.examples` directory to see available options.

### Tmux

The tmux environment file is sourced by the tmux status line scripts every time the status line updates so don't go overboard.

Options for tmux and the status line.
To enable an options we use the "TRUE" options as a text value. Any other value will be be treated as disabled.

- `TMUX_ENABLE_LINUX_BATTERY`
  - Enables the battery status for linux users
- `TMUX_ENABLE_MAC_BATTERY`
  - Enables the battery status for Mac users
- `TMUX_ENABLE_DEADBEEF`
  - Shows the currently playing song/artist for Deadbeef on Linux
- `TMUX_ENABLE_ITUNES`
  - Shows the currently playing song/artist for iTunes on Mac

