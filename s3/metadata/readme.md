## Create a new bucket
```md
aws s3 mb s3://aws-example-metadata-mk
```
## Create a file
```md
echo "Hello Metadata here!" > testmetadata.txt
```

## Upload a file with metadata
```md
aws s3api put-object --bucket aws-example-metadata-mk --key testmetadata.txt --body testmetadata.txt --metadata Country=India
```

## Get file metadata
aws s3api head-object --bucket aws-example-metadata-mk --key testmetadata.txt

## Cleanup
aws s3 rm s3://aws-example-metadata-mk/testmetadata.txt
aws s3 rb s3://aws-example-metadata-mk