#!/bin/bash
# Script for start all [STAGING] instance

#search all instance by regex
regex_env="*STAGING*"
aws_check_path=$(which aws)

##check aws cli install
if [ "$aws_check_path" != "/usr/local/bin/aws" ];
	then
	sudo curl -O https://bootstrap.pypa.io/get-pip.py
	sudo python get-pip.py
	sudo pip install awscli
	sudo pip install --upgrade awscli
	echo "AWS CLI success installed!"
	echo ""
	echo "Enter AWS access key, secret key and region. This credentials save in ~/.aws folder"
	#sudo aws configure
fi

#get all instanseы tags in $regex_env 
aws ec2 describe-instances --filters "Name=tag:Name,Values=$regex_env" --output text --query 'Reservations[*].Instances[*].Tags[*].Value'