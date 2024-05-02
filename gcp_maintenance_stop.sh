#!/bin/bash

instance_names=(slurm0-a3-ghpc-{0..74})

# set zone
zone=asia-southeast1-c

>error_log.txt

# stop instances
export zone
parallel 'echo "Stopping {}..." && gcloud compute instances stop {} --zone=$zone --discard-local-ssd=true' ::: ${instance_names[@]}

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
