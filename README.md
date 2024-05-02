# GCP Lustre

Login Node から Internal IP でアクセスして ansible を流そうとした際、password を求められてエラーが出たので、各ノードに入って以下を実行した。

```bash
sudo ./scripts/gcp-ansible/setup_lustre.sh
```

# GPU Maintenance

75 node stop

```bash
bash gcp_maintenance_stop.sh
```

75 node start

```bash
bash gcp_maintenance_start.sh
```

nvidia-smi check & lustre mount

```bash
bash nvidia-smi-check.sh
```
