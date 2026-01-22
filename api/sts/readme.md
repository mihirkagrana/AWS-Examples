## Create a new user and access key for user
```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

## Create a profile in AWS credentials file with access key just generated for user.
## It can be found in your user's root folder, e.g. C:\Users\mihir\.aws
```sh
nano ~/.aws/credentials
```

## Check user identify by specifing profile
```sh
aws sts get-caller-identity --profile sts
```
## make sure user does not have access to s3
```sh
aws s3 ls --profile sts
```

## Create CFT template to create S3 bucket, IAM role and IAM policy. Deploy the CFN template
```sh
./deploy
```

## Create a IAM policty to allow user to assume role. Attach policy with user
```sh
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAssumePolicy \
    --policy-document file://policy.json
```

## Assume role
aws sts assume-role \
    --role-arn arn:aws:iam::741181707369:role/sts-stack-StsRole-PEreVlb0dCKd \
    --role-session-name s3-sts \
    --profile sts

## Add the assumed credentials to credentials file and check identity
```sh
nano ~/.aws/credentials
aws sts get-caller-identity --profile assumed
```

## Access S3 bucket with the assumed identity
```sh
aws s3 ls --profile assumed
```

## Cleanup
Delete CF stak from AWS Console.
```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
aws iam delete-access-key  --access-key-id AKIA2ZEO7KRUXZAJRUF5 --user-name sts-machine-user
aws iam delete-user --user-name sts-machine-user
```