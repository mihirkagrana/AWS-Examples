## Create a new bucket
```md
aws s3 mb s3://aws-example-acls-mk
```
## Create a file
```md
echo "Hello ACLs here!" > testacls.txt

## Upload file
```md
aws s3 cp testacls.txt s3://aws-example-acls-mk
```

## Block public access
```md
aws s3api put-public-access-block \
    --bucket aws-example-acls-mk \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Get public access
```md
aws s3api get-public-access-block \
    --bucket aws-example-acls-mk
```

## Change bucket ownership
```md
aws s3api put-bucket-ownership-controls \
    --bucket aws-example-acls-mk \
    --ownership-controls="Rules=[{ObjectOwnership=ObjectWriter}]"
```

## Change ACLs to allow for a user in another acount
```md
aws s3api put-bucket-acl \
    --bucket aws-example-acls-mk \
    --access-control-policy file://E:/Mihir/Projects/AWS/SAA-C03/AWS-Examples/s3/acls/acl-policy.json
```

## access bucket from the grantee aws account
```md
aws s3 ls aws-example-acls-mk
touch aws2file.txt
aws s3 cp aws2file.txt s3://aws-example-acls-mk/aws2file.txt
aws s3 ls aws-example-acls-mk
```

## cleanup
```md
aws s3 rm s3://aws-example-acls-mk/aws2file.txt
aws s3 rm s3://aws-example-acls-mk/testacls.txt
aws s3 rb s3://aws-example-acls-mk
```