# TO DO - Complete this hands on. Following code was generated using ChatGPT, but have not been completed yet.

import boto3

s3 = boto3.client("s3", region_name="ap-south-1")

# Create the S3 Bucket
bucket_name = "aws-example-bucket-key-demo-mk"

s3.create_bucket(
    Bucket=bucket_name
)

print(f"Bucket {bucket_name} created")

# Enable SSE-KMS with Bucket Key
kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd-1234-efgh-5678"

s3.put_bucket_encryption(
    Bucket=bucket_name,
    ServerSideEncryptionConfiguration={
        "Rules": [
            {
                "ApplyServerSideEncryptionByDefault": {
                    "SSEAlgorithm": "aws:kms",
                    "KMSMasterKeyID": kms_key_arn
                },
                "BucketKeyEnabled": True
            }
        ]
    }
)

print("Default encryption with SSE-KMS and Bucket Key enabled")

# Upload an Object
s3.put_object(
    Bucket=bucket_name,
    Key="example.txt",
    Body="Hello, this object uses S3 Bucket Key encryption"
)

print("Object uploaded using SSE-KMS with Bucket Key")



