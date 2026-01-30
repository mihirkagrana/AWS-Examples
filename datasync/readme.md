## Create buckets

```sh
aws s3 mb s3://aws-example-source-datasync-mk
aws s3 mb s3://aws-example-destination-datasync-mk
```

# Upload file
```sh
aws s3 cp ./Hello.txt s3://aws-example-source-datasync-mk/data/Hello.txt
```