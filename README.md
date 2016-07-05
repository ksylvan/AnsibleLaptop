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

You can create a local `group_vars/` directory with a file `all` to set
the following variables:

| Name | Explanation |
|----------------|-----------------------------------------|
| docker_selinux | For Fedora 24, set this to `permissive` |

The `group_vars/*` files are ignored by git, so your setup will not
be over-written by subsequent updates.

## Demo

Using this on a newly instantiated Fedora 24 system:

[![asciicast](https://asciinema.org/a/77324?speed=4&autoplay=1&loop=1)](https://asciinema.org/a/77324?speed=4&autoplay=1&loop=1)
