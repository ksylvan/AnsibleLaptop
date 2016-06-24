# AnsibleLaptop
Reproducible Developer Laptop configuration with Ansible

## Motivation
I want to demote my laptop from being a "pet" to being "cattle". I will not lovingly
nurture and feed my laptop with hand-crafted customizations and idiosyncratic non-standard
installed software. My laptop is here to be used for a job, and if I lose it or a disk crashes,
I should be able to simply replace it and reproduce its setup quickly and with a minimum of fuss.

## Principles

1. No hand installing of software beyond the initial install or editing of system files or customization.
2. Use containers as much as possible in preference to installing software on the host system.
3. Use Ansible playbooks (stored in this repo) exclusively for all system level installs and configuration.
4. User files (/home) to be backed up to a cloud backup solution of your choice.

## The Goal

With the above in place, if the laptop falls in a river, no big deal.
Get another laptop, apply the minimal install, run the Ansible playbooks here and restore your user data.

## Setup

1. Install the latest version of Fedora Workstation [from here](https://getfedora.org/en/workstation/download/)
2. When installing, create your user account and assign it as an administrator (so that you can `sudo` to elevate permissions)
3. Run this command:

    curl https://github.com/ksylvan/AnsibleLaptop/raw/master/quickstart | sh
