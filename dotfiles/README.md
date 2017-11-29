# Barry’s dotfiles

<img alt="Screenshot of my shell prompt" src="https://user-images.githubusercontent.com/5648875/28853780-868ae394-76f8-11e7-8016-10965c9d0c2a.png" width="275">

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the install script

The `dotfiles` subdir can be used without any `macos-prime` files. Store it anywhere. I keep it in `~/Projects/GitHub/macos-prime/dotfiles`, though.

`dotfiles` serves as a working directory to track your customizations. When you're ready to use them, `cd` into your local `dotfiles` repository and then:

```bash
source install.sh
```

Alternatively, avoid the confirmation prompt:

```bash
set -- -f; source install.sh
```

Everytime you make changes in `dotfiles`, you'll have to run the install script again to update.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

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

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### macOS Preferences

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

## Thanks

* [Aaron Weiss](http://aaronweiss.us) and his [dotfiles repository](https://github.com/aatxe/dotfiles)
* [Eduardo Lundgren](http://eduardo.io) and his [dotfiles repository](https://github.com/eduardolundgren/dotfiles)
* [Lauri ‘Lri’ Ranta](http://lri.me) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Mathias Bynens](https://mathiasbynens.be) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)