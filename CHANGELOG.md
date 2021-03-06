# Change Log for AnsibleLaptop

## 1.0.6
- Cache the packages specified by URLs
- Change documentation about the `urls` (no longer recommend commenting out)

## 1.0.5
- Use `make` to simplify Ansible execution.
- All config files now in ~/.ansible_laptop/ directory
- User now can just backup that directory to save their setup.

## 1.0.4
- Conditionally run local customization playbook
- Add documentation about `local.yml`

## 1.0.3
- Break out packages by name (state=latest), versus URLs (state=present)
- Add `my_yum_repos` variable to enable adding extra repositories (google
  chrome, etc)

## 1.0.2
- Document `docker_testing` boolean used by the docker role.

## 1.0.1
- Revamped the way the playbook uses variables.
- Renamed bootstrap/ansible -> bootstrap/setup
- setup script creates ~/.ansible_laptop.yml if it does not exist.

## 1.0.0
- Re-organized to use the ksylvan.docker role
- Removed the variable setting on the role, use group_vars file instead

## 0.9.0
- Initial version with documentation, quick start scripts, docker role.
- Add python2-dnf (for Ansible dnf module)
