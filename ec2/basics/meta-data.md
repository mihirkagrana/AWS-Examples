## Launch an EC2 instance manually. Give it SSM role and enable IMDv1 and v2 while launching.
## Connect to instance from console.
## Run following command to get meta-data using IMDv1.
```sh
wget -qO- http://169.254.169.254/latest/meta-data/
curl http://169.254.169.254/latest/meta-data/
```

## Get specific value like public IP
```sh
wget -qO- http://169.254.169.254/latest/meta-data/public-ipv4
```

## Modify instance meta-data to allow only IMDv2.
```sh
aws ec2 modify-instance-metadata-options \
    --instance-id i-00124ded5fcb93b91 \
    --http-tokens required \
    --region ap-south-1
```

## Get token for IMDV2. 169.254.169.254 is the internal IP to get meta data information.
```sh
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/
```

