#!/bin/bash

instance_names=(slurm0-a3-ghpc-{73..74})

# set zone
zone=asia-southeast1-c

# stop instances
for instance in ${instance_names[@]}
do
  echo "Stopping $instance..."
  gcloud compute instances stop $instance --zone=$zone --discard-local-ssd=true
done

# check status
for instance in ${instance_names[@]}
do
  status=$(gcloud compute instances describe $instance --zone=$zone --format="value(status)")
  echo "$instance: $status"
  if [[ $status != "TERMINATED" ]]; then
    echo "$instance failed to stop and is in $status state." >> error_log.txt
  fi
done

echo "All instances processed. Check error_log.txt for any failures."
