# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Check if composer is installed
if command -v composer >/dev/null 2>&1; then
    # Get Composer's global bin directory
    COMPOSER_BIN_DIR="$(composer global config bin-dir --absolute 2>/dev/null)"

    # Check if the directory exists and is not already in PATH
    if [ -n "$COMPOSER_BIN_DIR" ] && [ -d "$COMPOSER_BIN_DIR" ] && [[ ":$PATH:" != *":$COMPOSER_BIN_DIR:"* ]]; then
        export PATH="$COMPOSER_BIN_DIR:$PATH"
    fi
fi

PATH="$HOME/.local/app/openjdk/bin:$PATH"

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/key > /dev/null 2>&1
