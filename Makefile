# Makefile for convenience
#

.PHONY: all deploy galaxy setup test clean

# Set DEBUG to -v, -vv, or -vvv for playbook debugging.
#
DEBUG=
LOCAL=$(HOME)/.ansible_laptop/local.yml
LOCAL_PB=./.local.yml

all: galaxy deploy

deploy:
	@echo '---' > $(LOCAL_PB)
	@echo '# autogenerated by Makefile' >> $(LOCAL_PB)
	@if [ -r $(LOCAL) ]; then \
		echo '- include:' $(LOCAL) >> $(LOCAL_PB); \
	else \
		echo '- hosts: laptop' >> $(LOCAL_PB); \
		echo '  gather_facts: no' >> $(LOCAL_PB); \
		echo '  tasks:' >> $(LOCAL_PB); \
		echo '    - name: Optional local playbook missing' >> $(LOCAL_PB); \
		echo "      debug: msg='$(LOCAL) does not exist.'" >> $(LOCAL_PB); \
	fi
	@ansible-playbook $(DEBUG) site.yml

galaxy: requirements.yml
	@ansible-galaxy install -p roles -r requirements.yml

setup:
	@./bootstrap/setup

test:
	@if ansible laptop -m ping; then \
		echo "SUCCESS: Ansible is working correctly against localhost."; \
	else \
		echo "ERROR: Something is wrong with your setup."; \
	fi

clean:
	@rm -rf ./cache
