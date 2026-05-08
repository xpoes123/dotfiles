#!/usr/bin/env bash
# Symlink dotfiles to their correct locations.
# Run once on a fresh machine after cloning.

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$DOTFILES/$1"
    local dst="$HOME/$1"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  linked $1"
}

echo "Installing dotfiles..."

link .config/hypr/hyprland.conf
link .config/hypr/hyprlock.conf
link .config/waybar/config.jsonc
link .config/waybar/style.css
link .config/kitty/kitty.conf
link .config/fish/config.fish
link .config/rofi/bookmarks
link .config/mako/config
link .config/starship.toml
link .tmux.conf
link .local/bin/wallpaper-loop
link .local/bin/video-wallpaper
link .local/bin/ambient-toggle
link .local/bin/lofi-toggle
link .local/bin/claude-scratchpad
link .local/bin/claude-usage
link .local/bin/rofi-bookmarks
link .local/bin/keybind-cheatsheet

chmod +x "$DOTFILES"/.local/bin/*
echo "Done."
