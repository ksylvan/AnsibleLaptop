# Change Log for AnsibleLaptop

## 1.0.1
- Re-vanped the way the playbook uses variables.
- Renamed bootstrap/ansible -> bootstrap/setup
- setup script creates ~/.ansible_laptop.yml if it does not exist.

## 1.0.0
- Re-organized to use the ksylvan.docker role
- Removed the variable setting on the role, use group_vars file instead

## 0.9.0
- Initial version with documentation, quick start scripts, docker role.
- Add python2-dnf (for Ansible dnf module)
