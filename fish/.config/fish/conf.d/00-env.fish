# 00-env.fish: Environment variable definitions and PATH modifications

# --- Core Environment Variables ---
set -gx EDITOR "nvim"
set -gx VISUAL "$EDITOR"

set -gx PAGER "less"
set -gx LESS "-R"

set -gx LANG "en_CA.UTF-8"
set -gx LC_ALL "en_CA.UTF-8"

# --- Development-related Environment Variables ---
# TODO 

# --- Path Modifications ---
fish_add_path ~/bin

# --- General Universal Variables ---
set -U fish_greeting "" # Suppress the default welcome message
