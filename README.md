# GCP Lustre

Login NodeからInternal IPでアクセスしてansibleを流そうとした際、passwordを求められてエラーが出たので、各ノードに入って以下を実行した。

```bash
sudo ./scripts/gcp-ansible/setup_lustre.sh
```
