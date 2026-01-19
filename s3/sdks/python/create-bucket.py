import logging
import boto3
from botocore.exceptions import ClientError


def create_bucket(bucket_name, region='us-east-1'):
    """Create an S3 bucket in a specified region

    If a region is not specified, the bucket is created in the S3 default
    region (us-east-1).

    :param bucket_name: Bucket to create
    :param region: String region to create bucket in, e.g., 'us-west-2'
    :return: True if bucket created, else False
    """
    # Create bucket
    try:
        print(f"Creating Bucket '{bucket_name}' in regin '{region}'")
        bucket_config = {}
        s3_client = boto3.client('s3', region_name=region)
        if region != 'us-east-1':
            bucket_config['CreateBucketConfiguration'] = {'LocationConstraint': region}

        s3_client.create_bucket(Bucket=bucket_name, **bucket_config)
        print("Bucket created")
    except ClientError as e:
        print("Error in bucket creation")
        logging.error(e)
        return False
    return True

if __name__ == "__main__":
    create_bucket("aws-example-python-bucket", "us-east-1")