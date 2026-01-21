## Create a new bucket
```md
aws s3 mb s3://aws-example-bucket-policy-mk
```

## Attack a bucket policy
```md
aws s3api put-bucket-policy --bucket aws-example-bucket-policy-mk --policy file://E:/Mihir/Projects/AWS/SAA-C03/AWS-Examples/s3/bucket-policies/across-account-access-policy.json
```

## Different AWS account
## Add IAM policy to user = iam-policy.json. Manually add to user in different account.
## to check if user can access the bucket.
## Todo: Getting permission denied error. Need to fix it.
aws s3 ls aws-example-bucket-policy-mk