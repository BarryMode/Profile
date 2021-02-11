# Barry's Dotfiles

## Install

Run the following script to install my dotfiles. This will create symlinks in your `$HOME` folder for each of the dotfiles. As you add or remove files, simply rerun this install script to sync your changes. Dead links get removed and new links get added.

```bash
~//dotfiles/install.sh
```

## Customize

### Commands

The `.commands` folder is intended for you to add and remove custom commands in a categorical way. Cherry-pick what you want. Refer to `~//dotfiles/.commands/template` for a basic example to create your own commands.

Here's what I've got in there for you:

- [`$`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/%24): Sensible Terminal defaults
- [`dock`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/dock): Control your Dock
- [`download`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/download): Download links, music, and videos
- [`finder`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/finder): View files, get info, perform actions, extract, compress, etc.
- [`images`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/images): Batch resizing images
- [`mac`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/mac): A CLI for macOS - ex. Bluetooth, Spotlight, Wi-Fi, Gatekeeper
- [`maintenance`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/maintenance): Common fixes and system maintenance
- [`network`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/network): Get IP addresses and flush your dns
- [`ringtone`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/ringtone): Turn any mp3 into a ringtone for your phone
- [`strings`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/strings): Format text and encode/decode in base64, binary, hex, md5, and sha1
- [`update`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/update): Update all the things
- [`video`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/video): Remux, encode, or merge videos

### Add to the `$PATH`

If `~/.path` exists, it gets loaded. Here's an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Private

If `~/.private` exists, it gets loaded. Use this to add private code that you don't want to commit to a public repository. My `~/.private` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Username"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="username@users.noreply.github.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
# Use "gpg --list-secret-keys --keyid-format LONG" to find the signing key
# For users with 2 factor authentication enabled: if git asks you to sign in, use an access token as your password
# Get an access token here: https://github.com/settings/tokens
GIT_SIGNING_KEY="hahahahahahahaha"
git config --global user.signingkey "$GIT_SIGNING_KEY"
```

### System Preferences

When you've got a new Mac, you may want to customize your settings. Modify `.macos` to your liking, then:

```bash
./.macos
```
