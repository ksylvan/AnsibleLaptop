# AnsibleLaptop
Reproducible Developer Laptop configuration with Ansible

## Motivation
I want to demote my laptop from being a "pet" to being "cattle". I will not
lovingly nurture and feed my laptop with hand-crafted customizations and
idiosyncratic non-standard installed software. My laptop is here to be used for
a job, and if I lose it or a disk crashes, I should be able to simply replace it
and reproduce its setup quickly and with a minimum of fuss.

## Principles
1. No hand installing of software, editing system files, or customization.
2. Use containers as much as possible in preference to installing software on
the host system.
3. Use Ansible playbooks (stored in this repo) exclusively for all system level
installs and configuration.
4. User files (/home) to be backed up to a cloud backup solution of your choice.

## The Goal
With the above in place, if the laptop falls in a river, no big deal. Get
another laptop, apply the minimal install, run the Ansible playbooks here and
restore your user data.

## Quick Start
* Install the latest version of Fedora Workstation
[from here](https://getfedora.org/en/workstation/download/)
* During the installation:
  * Set your root password.
  * Create your own user account and make it an administrator account (so
    you can `sudo` and ansible commands can elevate permissions)
* Once the installation completes, log in as the user you just created
and run this command:

      curl -fsSL https://github.com/ksylvan/AnsibleLaptop/raw/master/bootstrap/clone | sh

* Follow the instructions that the script prints on the screen to proceed.

## Variables

Once you run the `clone` script and follow the instructions, you will have
an `AnsibleLaptop` directory in your home directory and a
new `${HOME}/.ansible_laptop.yml` with variables you can set:

| Name | Explanation |
|----------------|-----------------------------------------|
| docker_selinux | For Fedora 24, set this to `permissive` |
| docker_testing | For Fedora 24, set this to True |
| my_yum_repos | List of extra repositories |
| my_packages | List of packages to install |

The `.ansible_laptop.yml` file contains the customizations and can be
backed up and restored onto a new machine to recreate the setup.

The `my_yum_repos` contains information for setting up external repositories
(such as google-chrome). For example:

    my_yum_repos:
      google-chrome:
        description: 'Google Chrome Repository'
        baseurl: http://dl.google.com/linux/chrome/rpm/stable/$basearch
        enabled: 1
        gpgcheck: 1
        gpgkey: https://dl-ssl.google.com/linux/linux_signing_key.pub

The above will create a file `/etc/yum.repos.d/google-chrome.repo` which
enables the standard google chrome yum repository.

The `my_packages` hash contains a list of names (as recognized by the `dnf`
command), or URLs to files, for example, to install `sshfs`, `screen`,
`google-chrome-stable` and the `atom` editor, use the following snippet.

    my_packages:
      names:
        - sshfs
        - screen
        - google-chrome-stable
      urls:
        - https://github.com/atom/atom/releases/download/v1.8.0/atom.x86_64.rpm

Note that the above  assumes that we already installed the google chrome yum
repo via the `my_yum_repos` declaration.

Special Tip: Since the packages specified by their download links are
downloaded each time the playbook runs, I recommend commenting out the `urls`
part of the `my_packages` hash after the packages have been installed the first
time, to speed up subsequent runs.

## Demo

Using this on a newly instantiated Fedora 24 workstation install:

[![asciicast](https://asciinema.org/a/78697.png "AnsibleLaptop Demo")](https://asciinema.org/a/78697?speed=4&autoplay=1)
