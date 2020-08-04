txchen development environment settings

## Installation

```bash
# install neovim for linux
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

# configure git, zsh, tmux and vim
mkdir -p ~/code/github
cd ~/code/github
git clone https://github.com/txchen/DevEnvSetup.git
cd DevEnvSetup
./install-configs.sh
```

## Keymaps

[Note](https://www.notion.so/txchen/c9879f02774d49c0a22c2db3450107ae)
