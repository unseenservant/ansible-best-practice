# Ansible Best Practices Directory Structure

## Why?

Who has time to learn "best practices" or complicated directory structures when your Project Leader wants your product delivered ASAP?

I sure don't have that kind of time! So I created this small project to do it for me! There isn't a lot here; but I hope this project will help you to get to work faster and easier!

## What's Here?

| Item | Description |
| --- | --- |
| Ansible-Make-Best-Practice-Dir-Structure.sh | Bash script to create boilerplate directory structure |
| BestPractice-DirectoryLayout.txt | Copied from [Ansible](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#directory-layout)'s documentation on the subject |
| Demo/ | A directory containing a demonstration of the script's output |

## How to Use

1. Clone this repo to wherever you plan to use Ansible. Say like an [Ansible Tower](https://www.ansible.com/products/tower) or [Foreman server](https://www.theforeman.org/plugins/foreman_ansible/2.x/index.html)
2. Ensure ``Ansible-Make-Best-Practice-Dir-Structure.sh`` is executable and located at the root of your working directory. (Ex. ``/home/YourUsername``).
3. Give the script a single argument, which should be the name of the product infrastructure you plan to manage. (Ex. ``Ansible-Make-Best-Practice-Dir-Structure.sh ProductName``)

Enjoy!

## Coming Soon

- [ ] A OS agnostic version for anyone to enjoy
