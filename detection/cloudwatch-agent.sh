#!/bin/bash

# Launch an EC2 instance
# Create an IAM role which has access to CloudWatch and SSM and assign it to EC2. Assign these policies - CloudWatchAgentServerPolicy, CloudWatchAgentAdminPolicy and AmazonSSMManagedInstanceCore.
# Install Apache on EC2
# Create index.html file and start httpd service
# Access index file using public IP to generate some traffic.


# install the agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm 
sudo rpm -U ./amazon-cloudwatch-agent.rpm

# run the wizard
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard

# create some missing files
sudo mkdir -p /usr/share/collectd
sudo touch /usr/share/collectd/types.db

# options: Run only first one.
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:AmazonCloudWatch-linux -s

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

# Give permission to agent to read logs
sudo setfacl -m u:cwagent:rx /var/log/httpd/
sudo setfacl -m u:cwagent:r /var/log/httpd/access_log
sudo setfacl -m u:cwagent:r /var/log/httpd/error_log