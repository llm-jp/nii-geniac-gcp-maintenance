#!/bin/bash

# インスタンス名のリスト
instance_names=(slurm0-a3-ghpc-{0..74})

# ゾーンの設定
zone=asia-southeast1-c

# エラーホストのファイル
error_file="error_hosts.txt"

# ファイルを空にする
>$error_file

# ssh & nvidia-smi check
export zone error_file
parallel 'echo "Checking nvidia-smi on {}..." && gcloud compute ssh {} --zone=$zone --command "nvidia-smi" || echo {} >> $error_file' ::: ${instance_names[@]}

echo "NVIDIA-smi check completed."

# lustre mount
parallel 'echo "Checking Lustre mount on {}..." && gcloud compute ssh {} --zone=$zone --command "bash scripts/geniac-gcp-setup/setup_lustre.sh" || echo {} >> $error_file' ::: ${instance_names[@]}

echo "Lustre mount completed."
