## Install yq if not already installed
## Command to install yq for windows below. Open PowerShell in administrative mode to install it
```sh
choco install yq
```

## Convert policy from yaml to json as IAM policies supports json only
```sh
./update
```

## Create user policy
aws iam create-policy \
    --policy-name test-policy \
    --policy-document file://policy.json

## Create a test user in IAM manually. Generate access key for this test user and add to aws credentials file
## Do not attach any policies to user. Check if user has permission to list S3 buckets. You should get permission error.
```sh
aws s3 ls --profile iam-testing
```

## Attach policy with user
aws iam attach-user-policy \
    --policy-arn arn:aws:iam::741181707369:policy/test-policy \
    --user-name iam-testing

## Now update policy to allow list bucket for S3 and create new policy version. Add create bucket policy version in update script.
```sh
./update
```

## Now you should be able to see the buket list
```sh
aws s3 ls --profile iam-testing
```