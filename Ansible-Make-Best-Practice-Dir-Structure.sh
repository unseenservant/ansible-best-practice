#!/usr/bin/env bash

# make a directory structure that conforms to ansible best practices 

# run this script at the rootdir where you want the project 
# example: /home/SomeUsername/$0 

function Help {
   # Display Help
   echo ""
   echo "Usage:"
   echo -e "
This script builds an Ansible project
directory heirarchy that conforms to
ansible best practices located: \n https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#directory-layout
"
   echo ""
   echo ""
   echo "options:"
   echo "-h     Print this Help."
   echo ""
   echo ""
   echo "First Argument = Name-of-Project"
   echo "Example: $0 projectname"
   echo
}

# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit
	;;
      *) # incorrect option
	 Help
         exit
	;;
   esac
done

project=$1 

# safety first! 
if [[ -d ${project} ]] ; then
echo -e "\n ${project} dir already exists ... aborting"
exit 1
fi

# make project folder
mkdir -vp ${project}

# make inventory dirs 
mkdir -vp ${project}/inventories \
${project}/inventories/production \
${project}/inventories/staging \
${project}/inventories/test \
${project}/inventories/lab 

# make library dir
mkdir -vp ${project}/library 

# make module dir
mkdir -vp ${project}/module_utils 

# make plugin filters dir
mkdir -vp ${project}/filter_plugins 

# make inventory subdirs for each environment & sample files
for i in production staging test lab ; do
	touch ${project}/inventories/$i/hosts #inventory file for environment
	mkdir -vp ${project}/inventories/$i/group_vars/
	
	touch ${project}/inventories/$i/group_vars/1st-group.yml \
	${project}/inventories/$i/group_vars/2nd-group.yml
	
	mkdir -vp ${project}/inventories/$i/host_vars/
	touch ${project}/inventories/$i/host_vars/1st-hostname.yml
done

# Make roles dir
mkdir -vp ${project}/roles \
${project}/roles/generic \
${project}/roles/1st-rolename \
${project}/roles/2nd-rolename \
${project}/roles/3rd-rolename

# make roles subdirectories & sample files
for i in generic 1st-rolename 2nd-rolename 3rd-rolename ; do
	mkdir -vp ${project}/roles/$i/tasks \
	${project}/roles/$i/handlers \
	${project}/roles/$i/templates \
	${project}/roles/$i/files \
	${project}/roles/$i/vars \
	${project}/roles/$i/defaults \
	${project}/roles/$i/meta \
	${project}/roles/$i/library \
	${project}/roles/$i/module_utils \
	${project}/roles/$i/lookup_plugins

	touch ${project}/roles/$i/tasks/main.yml \
	${project}/roles/$i/handlers/main.yml \
	${project}/roles/$i/templates/1st-template-file.j2 \
	${project}/roles/$i/files/foo.txt \
	${project}/roles/$i/vars/main.yml \
	${project}/roles/$i/defaults/main.yml \
	${project}/roles/$i/meta/main.yml
done

# make a playbook file
touch ${project}/1st-playbook.yml
