## Create a new bucket
```md
aws s3 mb s3://aws-example-encryption-mk
```

## Copy index.html file to S3 bucket
## It will use default encryption of SSE-S3
```md
aws s3 cp testencryption.txt s3://aws-example-encryption-mk
```

## Put object with encryption of SSE-KMS
```md
aws s3api put-object \
    --bucket aws-example-encryption-mk \
    --key testencryption.txt \
    --body testencryption.txt \
    --server-side-encryption aws:kms \
    --ssekms-key-id 4fd7c713-22db-4a1a-9c5e-fc7b1f57fc83
```

## Put object with encryption of SSE-C [Failed Attempt]

## Generate key
```md
ENCODED_KEY = $(openssl rand 32 | base64)

aws s3api put-object \
    --bucket aws-example-encryption-mk \
    --key testencryption.txt \
    --body testencryption.txt \
    --server-side-encryption aws:kms \
    --ssekms-key-id 4fd7c713-22db-4a1a-9c5e-fc7b1f57fc83
    --sse-customer-algorithm AES256
    --sse-customer-key $ENCODED_KEY
    --sse-customer-key-md5 
```

## Put object with encryption of SSE-C
```md
openssl rand -out ssec.key 32

aws s3 cp testencryption.txt s3://aws-example-encryption-mk/testencryption.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://aws-example-encryption-mk/testencryption.txt testencryption2.txt --sse-c AES256 --sse-c-key fileb://ssec.key
```

## Cleanup
```md
../bash-scripts/delete-bucket aws-example-encryption-mk
aws s3 rb s3://aws-example-encryption-mk
```