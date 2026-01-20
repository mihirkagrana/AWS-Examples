## This is a .md file with shell commands presented in Markdown format

## Create a new bucket
```md
aws s3 mb s3://aws-example-checksums-mk
```

## create a file to test checksum on
```md
echo "Hello Checksums" > testchecksums.txt
```

## Get checksum of file
```md
md5sum testchecksums.txt
## 6a8428c8a6c161bac89f9991c1037d2b *testchecksums.txt
```

## Upload file and look at its Etag
```md
aws s3 cp testchecksums.txt s3://aws-example-checksums-mk
aws s3api head-object --bucket aws-example-checksums-mk --key testchecksums.txt
```
## ETag: 6a8428c8a6c161bac89f9991c1037d2b
## You will see that checksum above is same as Etag.

## Lets upload a file with different value of checksum
## SHA1 - 594234f293a37ac95c03cbe6a676000f1ca32674
## Command to generate SHA1 checksum = certutil -hashfile "testchecksums.txt" SHA1

## checksum needs to be base64 encoded = WUI08pOjeslcA8vmpnYADxyjJnQ=
## Command to generate base64 encoded SHA 1 checksum = openssl sha1 -binary testchecksums.txt | base64

```sh
aws s3api put-object \
--bucket aws-example-checksums-mk \
--key testchecksumssha1.txt \
--body testchecksums.txt \
--checksum-algorithm SHA1 \
--checksum-sha1 WUI08pOjeslcA8vmpnYADxyjJnQ=
```