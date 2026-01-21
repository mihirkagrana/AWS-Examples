## Create a new bucket
```md
aws s3 mb s3://aws-example-prefixes-mk
```

## create a folder
```md
aws s3api put-object --bucket=aws-example-prefixes-mk --key=hello/
```

## Upload a file to folder
```md
echo "Hello Prefixes" > testprefixes.txt
aws s3 cp testprefixes.txt s3://aws-example-prefixes-mk/hello/
```