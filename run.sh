#!/bin/bash

ansible-playbook -i inventory_file --private-key=/Users/erwan/.ssh/era_ec2.cer aws_playbook.yml



