#!/usr/bin/python
# -*- coding: utf-8 -*-
# cloudstoragelist.py
# It is an example that handles Cloud Storage buckets on Google Cloud Platform (GCP).
# List information about the objects in a Cloud Storage Bucket
# You must provide 1 parameter:
# BUCKET_NAME = Name of the bucket

import os
import sys
import time

from google.cloud import storage
from google.cloud.exceptions import Forbidden, NotFound

def main():
    """Demo app to test the Cloud Storage functionality"""

    # Set the BUCKET_NAME environment variable to initialize the client
    bucket_name = os.environ.get("BUCKET_NAME", "undefined")

    if bucket_name == "undefined":
        print("Environment variable BUCKET_NAME is not set. Quitting.")
        sys.exit(1)

    print("Bucket name: " + bucket_name)

    while True:
        print("Listing objects ...")

        # Instantiate the client.
        client = storage.Client()

        try:
            # Instantiate the bucket
            bucket = client.bucket(bucket_name)
            # Get the bucket.
            bucket = client.get_bucket(bucket_name)
            # Lists all the blobs in the bucket.
            blobs = bucket.list_blobs()
            for blob in blobs:
                print(" -", blob.name)
                print("   size:",blob.size)
            print("\nListed")
        except NotFound:
            print("Error: Bucket does NOT exists!!")
            sys.exit(1)
        except Forbidden:
            print("Error: Forbidden, you do not have access to it!!")
            sys.exit(1)
        
        local_time = time.localtime()
        current_time = time.strftime("%H:%M:%S", local_time)
        print(f"[{current_time}] Sleeping...")
        time.sleep(30)

# This is the standart boilerplate that calls the main() function.
if __name__ == "__main__":
    main()