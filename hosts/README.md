# Unified hosts

Consolidates several reputable `hosts` files, and merges them into one file with duplicates removed. By default, all generated `hosts` files have base extensions that block adware and malware.

## Extensions

The unified `hosts` file is extensible. You manage extensions by curating the `extensions/` folder tree. See the [extensions README](https://github.com/BarryMode/macos-prime/blob/master/hosts/extensions/readme.md) for examples of customizing your hosts file (more command line options below).

## Generate your own unified `hosts` file

The `generate.py` script will generate a unified `hosts` file based on the sources in the local `data/` subfolder. The script will prompt you whether it should fetch updated versions (from locations defined by the `update.json` text file in each source's folder), otherwise it will use the `hosts` file that's already there.

### Usage

```bash
python generate.py [--auto] [--replace] [--ip nnn.nnn.nnn.nnn] [--extensions ext1 ext2 ext3]
```

For the purpose of this repo, I use `install.sh` with my own preconfiguration.

#### Command line options:

`--help`, or `-h`: display help.

`--auto`, or `-a`: run the script without prompting. When `--auto` is invoked,

* Hosts data sources, including extensions, are updated.
* No extensions are included by default. Use the `--extensions` or `-e` flag to include any you want.
* Your active `hosts` file is *not* replaced unless you include the `--replace` flag.

`--backup`, or `-b`: Make a backup of existing `hosts` file(s) as you generate over them.

`--extensions <ext1> <ext2> <ext3>`, or `-e <ext1> <ext2> <ext3>`: the names of subfolders below the `extensions` folder containing additional category-specific `hosts` files to include in the amalgamation. Example: `--extensions porn` or `-e social porn`.

`--flush-dns-cache`, or `-f`: skip the prompt for flushing the DNS cache. Only active when `--replace` is also active.

`--ip nnn.nnn.nnn.nnn`, or `-i nnn.nnn.nnn.nnn`: the IP address to use as the target. Default is `0.0.0.0`.

`--keepdomaincomments`, or `-k`: `false` (default) or `true`, keep the comments that appear on the same line as domains. The default is `false` since some router-based implementations can't handle comments in-line with hosts.

`--skipstatichosts`, or `-s`: `false` (default) or `true`,

`--noupdate`, or `-n`: skip fetching updates from hosts data sources.

`--output <subfolder>`, or `-o <subfolder>`: place the generated source file in a subfolder. If the subfolder does not exist, it will be created.

`--replace`, or `-r`: trigger replacing your active `hosts`

`--skipstatichosts`, or `-s`: `false` (default) or `true`, omit the standard section at the top, containing lines like `127.0.0.1 localhost`. This is useful for configuring proximate DNS services on the local network.

## How do I control which sources are unified?

Add one or more *additional* sources, each in a subfolder of the `data/` folder, and specify the `url` key in its `update.json` file.

Add one or more *optional* extensions, which originate from subfolders of the `extensions/` folder. Again the url in `update.json` controls where this extension finds its updates.

Create an *optional* `blacklist` file. The contents of this file (containing a listing of additional domains in `hosts` file format) are appended to the unified hosts file during the update process. A sample `blacklist` is included, and may be modified as you desire.

  * NOTE: The `blacklist` is not tracked by git, so any changes you make won't be overridden when you `git pull` this repo from `origin` in the future.

### How do I include my own custom domain mappings?

If you have custom hosts records, place them in file `.hosts`. The contents of this file are prepended to the unified hosts file during the update process.

The `.hosts` file is not tracked by git, so any changes you make won't be overridden when you `git pull` this repo from `origin` in the future.

### How do I prevent domains from being included?

The domains you list in the `whitelist` file are excluded from the final hosts file.

The `whitelist` uses partial matching. Therefore if you whitelist `google-analytics.com`, that domain and all its subdomains won't be merged into the final hosts file.

The `whitelist` is not tracked by git, so any changes you make won't be overridden when you `git pull` this repo from `origin` in the future.

## What is a hosts file?

A hosts file, named `hosts` (with no file extension), is a plain-text file used by all operating systems to map hostnames to IP addresses.

In most operating systems, the `hosts` file is preferential to `DNS`. Therefore if a domain name is resolved by the `hosts` file, the request never leaves your computer.

Having a smart `hosts` file goes a long way towards blocking malware, adware, and other irritants.

For example, to nullify requests to some doubleclick.net servers, adding these lines to your hosts file will do it:

```bash
# block doubleClick's servers
0.0.0.0 ad.ae.doubleclick.net
0.0.0.0 ad.ar.doubleclick.net
0.0.0.0 ad.at.doubleclick.net
0.0.0.0 ad.au.doubleclick.net
0.0.0.0 ad.be.doubleclick.net
# etc...
```

## Use `0.0.0.0` instead of `127.0.0.1` or `0`

Traditional host files use `127.0.0.1`, the *loopback address*, to establish an IP connection to the local machine. I prefer to use `0.0.0.0`, which is defined as a non-routable meta-address used to designate an invalid, unknown, or non applicable target. Using `0.0.0.0` is empirically faster, possibly because there's no wait for a timeout resolution. It also does not interfere with a web server that may be running on the local PC. Also, don't use `0`, because it doesn't work universally.

## Location of your `hosts` file

To modify your current `hosts` file, look for it in `/etc/hosts` and modify it with a text editor.

## Reloading `hosts` file

Your operating system will cache DNS lookups. You can either reboot or run the following commands to manually flush your DNS cache once the new `hosts` file is in place.

Run this in your shell:

```bash
sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
```

## Goals of this unified `hosts` file

1. automatically combine high-quality lists of hosts,
2. provide easy extensions,
3. de-dupe the resultant combined list,
4. and keep the resultant file reasonably sized.

A high-quality source is defined here as one that is actively curated. A hosts source should be frequently updated by its maintainers with both additions and removals. The larger the `hosts` file, the higher the level of curation is expected.

For example, the (huge) `hosts` file from [hosts-file.net](http://hosts-file.net) is **not** included here because it is very large (300,000+ entries) and doesn't currently display a corresponding high level of curation activity.

It is expected that this unified `hosts` file should serve all devices, regardless of OS.

## Thanks

* [Steven Black](http://stevenblack.com) and his [hosts repository](https://github.com/stevenblack/hosts)
