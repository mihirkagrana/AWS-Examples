## Create a new bucket
```md
aws s3 mb s3://aws-example-storage-class-mk
```
## Create a file
```md
echo "Hello Metadata here!" > teststorageclass.txt

## Upload file
```md
aws s3 cp teststorageclass.txt s3://aws-example-storage-class-mk --storage-class STANDARD_IA
aws s3 cp teststorageclass.txt s3://aws-example-storage-class-mk --storage-class DEEP_ARCHIVE
```

## Cleanup
```md
../bash-scripts/delete-bucket aws-example-storage-class-mk
aws s3 rb s3://aws-example-storage-class-mk
```