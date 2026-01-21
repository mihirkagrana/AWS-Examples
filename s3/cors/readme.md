## Create a new bucket
```md
aws s3 mb s3://aws-example-cors-mk
```

## Copy index.html file to S3 bucket
```md
aws s3 cp index.html s3://aws-example-cors-mk
```

## Enable static website hosting on bucket
aws s3api put-bucket-website --bucket aws-example-cors-mk --website-configuration file://website-config.json

## Disable block public access
```md
aws s3api put-public-access-block \
    --bucket aws-example-cors-mk \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Add bucket policy to allow public read access
```md
aws s3api put-bucket-policy --bucket aws-example-cors-mk --policy file://bucket-policy.json
```

## Check if website is accessible. Post request should give CORS error.
## http://aws-example-cors-mk.s3-website.ap-south-1.amazonaws.com/

## Add CORS policy to bucket.
```md
aws s3api put-bucket-cors --bucket aws-example-cors-mk --cors-configuration file://cors-policy.json
```

## Cleanup
```md
../bash-scripts/delete-bucket aws-example-cors-mk
aws s3 rb s3://aws-example-cors-mk
```