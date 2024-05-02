#!/bin/bash

# instance names
instance_names=(slurm0-a3-ghpc-{0..74})

# set zone
zone=asia-southeast1-c

# start instances
for instance in ${instance_names[@]}
do
  echo "Starting $instance..."
  gcloud compute instances start $instance --zone=$zone
done

echo "All instances are being started."
