# VPC Peering steps

## Create 2 VPCs from AWS console - single AZ, 1 public subnets, 0 private subnect
VPC A with CIDR range 10.0.0.0/16
VPC B with CIDR range 11.0.0.0/16

## Run following command to add peering connection
```sh
aws ec2 create-vpc-peering-connection --vpc-id vpc-0f4b18edf796236e7 --peer-vpc-id vpc-06aa854f8498227d9
```

## Accept the peering connection
```sh
aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-082c7cc2c87f69ba4
```

## Create a route in route table for VPC A to allow connection to B
```sh
aws ec2 create-route --route-table rtb-02109b44133fa4805 --destination-cidr-block 11.0.0.0/16 --vpc-peering-connection-id pcx-082c7cc2c87f69ba4
```

## Create a route in route table for VPC B to allow connection to A
```sh
aws ec2 create-route --route-table rtb-0113fd9e119a27be4 --destination-cidr-block 10.0.0.0/16 --vpc-peering-connection-id pcx-082c7cc2c87f69ba4
```

## Run CloudFormation templates to launch EC2 instances
Run CFT A. It has SSM permission so you can connect SSH through console.
Run CFT B. It has Apache installed, so you should be able to see the web page on this instance's public IP.

## Connect to instance A
Access the instance B public IP which has a web server and index file.
```sh
wget -qO - http://3.110.33.23
```

## Now access instance B with private IP. This should be accesible due to peering.
```sh
wget -qO - http://11.0.1.68
```

# Verification of VPC peering
## To prove our peering works, go to route table for VPC B and remove route for internet gateway.
This way the webpage will not be publially accessible in browser or on public iP - http://3.110.33.23/
But it will be accessible from instance A using private IP.

## Cleanup - Delete EC2s, VPCs, Peering