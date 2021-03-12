# Mac Prime

I use **Mac Prime** to automatically tailor my Mac. Use this as a basis for your own setup.

**Warning:** Before using, you should first [fork this repository](https://github.com/barrymode/mac-prime/fork), review the code, and remove things you don't want. Don't blindly use my settings. Use at your own risk!

## Overview

- [`packages`](https://github.com/BarryMode/mac-prime/tree/master/packages): Lists of installable apps and packages
- [`dotfiles`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles): Commands and configurations
- [`preferences`](https://github.com/BarryMode/mac-prime/tree/master/preferences): Presets for System Preferences
- [`dock`](https://github.com/BarryMode/mac-prime/tree/master/dock): Customize your Dock

## Packages

### Package Lists

- [`brewfile`](https://github.com/BarryMode/mac-prime/tree/master/packages/brewfile): An installable package list for [Brew](https://github.com/Homebrew/brew)
- [`npmfile`](https://github.com/BarryMode/mac-prime/tree/master/packages/npmfile): An installable package list for [NPM](https://github.com/npm/cli)
- [`pipfile`](https://github.com/BarryMode/mac-prime/tree/master/packages/pipfile): An installable package list for [PIP](https://github.com/pypa/pip)

### Install Packages

Run the following script to install all of my apps and programming tools.

```bash
~//packages/install.sh
```

## Dotfiles

### Install Dotfiles

Run the following script to install my [`dotfiles`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles). This will create symlinks in your `$HOME` folder for each of the dotfiles. As you add or remove files, simply rerun this install script to sync your changes. Dead links get removed and new links get added.

Note: Some of the files in [`dotfiles`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles) require [`packages`](https://github.com/BarryMode/mac-prime/tree/master/packages) to be installed first. If you don't want to install my [`packages`](https://github.com/BarryMode/mac-prime/tree/master/packages), then you at least need `stow` (ex. `brew install stow`) to successfully install [`dotfiles`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles).

```bash
~//dotfiles/install.sh
```

### Customize Dotfiles

#### [`.commands`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles/.commands) Folder

The [`.commands`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles/.commands) folder is intended for you to add and remove custom commands in a categorical way. Cherry-pick what you want. Refer to the [`template`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/template) file for a basic example of how to create your own commands.

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
- [`text`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/text): Format text and encode/decode in base64, binary, hex, md5, and sha1
- [`update`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/update): Update all the things
- [`video`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.commands/video): Remux, encode, or merge videos

#### [`.path`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.path) File

Append to the `$PATH`. Here's an example `.path` file that adds `/usr/local/bin` to the `$PATH`.

```bash
export PATH="/usr/local/bin:$PATH"
```

#### `.private` File

Use this to add private code that you don't want to commit to a public repository. My `.private` file looks something like this.

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

#### Other Dotfiles

There are several other files in [`dotfiles`](https://github.com/BarryMode/mac-prime/tree/master/dotfiles) that set some reasonable defaults including [`.hushlogin`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.hushlogin), [`.wgetrc`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.wgetrc), [`.gitconfig`](https://github.com/BarryMode/mac-prime/blob/master/dotfiles/.gitconfig), and more.

## Preferences

Use [`preferences`](https://github.com/BarryMode/mac-prime/blob/master/preferences) to make adjustments you would otherwise set in the System Preferences app. Define this file once and reuse it whenever you like. If your settings ever get messed up, this is a great way to reset them to the way you prefer.

```bash
~//preferences
```

## Dock

Customize your Dock in the [`dock`](https://github.com/BarryMode/mac-prime/blob/master/dock) file. Use these commands:

- `dock add "Terminal"`: Add an application to the macOS Dock
- `dock add:spacer`: Adds an empty space to macOS Dock
- `dock clear`: Removes all persistent icons from macOS Dock
- `dock reset`: Reset macOS Dock to default settings

Once you're done, run [`dock`](https://github.com/BarryMode/mac-prime/blob/master/dock) to apply the changes.

```bash
~//dock
```

## Hosts

Keep track of your hosts in the [`hosts`](https://github.com/BarryMode/mac-prime/blob/master/resources/hosts) file. Use the following command to replace your system hosts file with this one.

```bash
update hosts
```

## One-line Install

You can install everything with this one-liner.

```bash
git clone https://github.com/BarryMode/mac-prime.git ~/ && ~//prime.sh
```

## Author

<table>
  <thead>
    <tr>
      <th valign="middle" align="center">
        <a href="https://barrymode.com"><img alt="BarryMode" src="https://avatars3.githubusercontent.com/u/5648875?v=2&s=200" width="100" height="100"></a>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td valign="middle" align="center">
        <a href="https://barrymode.com"><strong>BarryMode</strong></a><br>
        <a href="https://www.youtube.com/barrymode"><img src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/youtube.svg" width="16" height="16"></a> <a href="https://github.com/barrymode"><img src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/github.svg" width="16" height="16"></a>
      </td>
    </tr>
  </tbody>
</table>
