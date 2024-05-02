#!/bin/bash

# instance names
instance_names=(slurm0-a3-ghpc-{0..74})

# set zone
zone=asia-southeast1-c

# start instances
export zone
parallel 'echo "Starting {}..." && gcloud compute instances start {} --zone=$zone' ::: ${instance_names[@]}

echo "All instances are being started."
