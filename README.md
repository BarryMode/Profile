# [macOS Prime](https://github.com/barrymode/macos-prime)

Personal guide to tailor my Mac.

## [Dotfiles](https://github.com/barrymode/dotfiles), [macOS Preferences](https://github.com/barrymode/dotfiles/blob/master/.macos), and [Applications](https://github.com/barrymode/macos-prime/tree/master/applications)

### One-line install

```bash
git clone https://github.com/barrymode/macos-prime.git ~/Projects/GitHub/macos-prime && cd ~/Projects/GitHub/macos-prime && ./prime.sh
```

### OR do it manually

#### Ready, Set…

```bash
git clone https://github.com/barrymode/macos-prime.git ~/Projects/GitHub/macos-prime
git clone https://github.com/barrymode/dotfiles.git ~/Projects/GitHub/macos-prime/dotfiles
ln -s ~/Projects/GitHub/macos-prime ~/prime
```

#### Go!

1. Open Home Folder `cd ~`
1. Install Dotfiles `prime/dotfiles/install.sh`
1. Install macOS Preferences `./.macos`
1. Install Applications `prime/applications/install.sh`

## Other Applications

The following apps will eventually be automated if they aren't replaced first. A tool to help in this process is [MAS](https://github.com/mas-cli/mas), a CLI for the [App Store](https://en.wikipedia.org/wiki/App_Store_(iOS)).

- Adobe Suite (Creative Cloud has me wanting to find alternatives)
- Byword (MAS)
- Melodyne
- Microsoft Remote Desktop (MAS)
- Pastebot (MAS)
- Spark (MAS)
- iShowU Audio Capture

  ```bash
  wget https://downloads.shinywhitebox.com/driver/latest/
  ```

## User Files

### 1st Backup: Local

- Blind Tiger [WD My Book](https://support.wdc.com/cat_products.aspx?ID=2)
  - Holmes Time Machine

- Adler [Synology NAS](https://www.synology.com/en-us/products) [RAID 1](https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_1)
  - Movies

### 2nd Backup: Cloud

- [Dropbox](https://dropbox.com) is empty
- [Google Drive](https://drive.google.com/)
  - Books
  - Movies
- [iCloud](https://www.icloud.com)
  - App Data
    - Automator
    - Byword
    - Calendars
    - Contacts
    - Keychain
    - Notes
    - Safari
    - Spark
    - Transmit

Note: Pictures, Games, Music, and Projects do not currently have a 2nd backup.

## Author

| [![BarryMode](https://avatars3.githubusercontent.com/u/5648875?v=2&s=70)](https://twitter.com/barrymode "Follow @BarryMode on Twitter") |
|---|
| [BarryMode](https://barrymode.github.io) |