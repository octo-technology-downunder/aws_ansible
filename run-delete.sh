#!/bin/bash 

#export AWS_ACCESS_KEY_ID = "SORRY_BOTS"
#export AWS_SECRET_ACCESS_KEY = "DUMMY_KEY_ONLY"

export AWS_DEFAULT_REGION=us-east-1
export PLUGIN_ROOT=/data/git/octo/ansible-ec2-test/aws_ansible/plugins/inventory
export EC2_INI_PATH=$PLUGIN_ROOT/ec2.ini

function title() {
  echo
  echo "**********************************************"
  echo "> $@"
}


title List ec2 resources
echo "> Running: ec2.py --list"
$PLUGIN_ROOT/ec2.py --list


title Run Ansible aws_delete.yml playbook with ec2.py inventory plugin activated
echo "> ansible-playbook -i $PLUGIN_ROOT/ec2.py --private-key=/Users/erwan/.ssh/era_ec2.cer aws_delete.yml"
ansible-playbook -i $PLUGIN_ROOT/ec2.py --private-key=/Users/erwan/.ssh/era_ec2.cer aws_delete.yml --extra-vars 'aws_region='$AWS_DEFAULT_REGION


