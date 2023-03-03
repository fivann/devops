## Ansible Core Concepts
- Inventory: A list of hosts that Ansible manages.
- Playbook: A YAML file that defines tasks to be executed on hosts.
- Task: A unit of work defined in a playbook.
- Module: A pre-built command that performs a specific task (e.g., copy files, start/stop services, install packages).
- Play: A set of tasks executed on a group of hosts.
- Role: A reusable set of tasks and configurations that can be shared across multiple playbooks.

## Ansible Commands
- ansible: Run a command on one or more hosts.
- ansible-playbook: Run a playbook on one or more hosts.
- ansible-galaxy: Manage roles, collections, and other resources.
- ansible-vault: Encrypt and decrypt sensitive data in playbooks.

## Basic Ansible Commands
- ansible all -m ping: Ping all hosts to test connectivity.
- ansible all -a 'whoami': Run the whoami command on all hosts.
- ansible all -m command -a 'ls -la': List files on all hosts.
- ansible all -m shell -a 'echo $HOME': Print the $HOME environment variable on all hosts.
- ansible all -m copy -a 'src=file.txt dest=/tmp/file.txt': Copy a file to all hosts.

## Ansible Playbook Commands
- ansible-playbook playbook.yml: Run a playbook.
- ansible-playbook playbook.yml --check: Dry-run a playbook to test changes.
- ansible-playbook playbook.yml --tags <tagname>: Run specific tasks or roles with a tag.
- ansible-playbook playbook.yml --limit <hostname>: Run a playbook on a specific host.
- ansible-playbook playbook.yml --vault-id <name>@prompt: Prompt for the vault password when running the playbook.
  
## Ansible Galaxy Commands
- ansible-galaxy init <rolename>: Create a new role.
- ansible-galaxy install <rolename>: Install a role.
- ansible-galaxy list: List installed roles.
  
This is just a brief overview of some of the most commonly used Ansible commands and concepts. 
  Ansible is a powerful and flexible tool with many advanced features and options, 
  so be sure to consult the official Ansible documentation for more detailed information and examples.
  
  
  
In Ansible, an **ad-hoc** command is a one-liner Ansible command that allows you to perform quick 
  and simple tasks on remote servers. It is a powerful feature that allows you to run an Ansible 
  module against one or more hosts without the need for a playbook.
  
**Ansible Galaxy** is a hub for sharing and discovering Ansible roles, collections, and other resources. 
  It is a public repository that hosts a large number of reusable Ansible content, 
  including roles, modules, plugins, playbooks, and more.
  
Ansible Galaxy offers a variety of benefits for Ansible users, including:

- Easy access to a large library of reusable Ansible content
- Standardization of role and collection structure
- Community-driven development and contribution
- Simplified distribution of roles and collections to others
- Version control and tagging of roles and collections
  
