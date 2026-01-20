## Create a new bucket
```md
aws s3 mb s3://aws-example-prefixes-mk
```

## create a file to test checksum on
```md
echo "Hello Checksums" > testprefixes.txt
aws s3 cp testprefixes.txt s3://aws-example-prefixes-mk
```