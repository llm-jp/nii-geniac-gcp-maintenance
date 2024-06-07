# GPU Maintenance

Google CloudのGPU Instanceはライブマイグレーションの対象外であるため、2週間に1回の頻度でホストメンテナンスイベントが発生する。([GPUホストイベントの処理](https://cloud.google.com/compute/docs/gpus/gpu-host-maintenance?hl=ja))

GPUホストイベントを検知し、自動でメンテナンスを行うことも可能であるが、10-12日に1回の頻度でGPU Instanceすべてを停止させることで、任意のタイミングでメンテナンスを行うことができる。これにより、学習中のジョブが意図せぬタイミングで中断されることを防ぐことができる。以下に、75 nodeのメンテナンス手順を示す。

## メンテナンス手順

### 1. GPU Instanceの停止

以下のコマンドで75 nodeのGPU Instanceを停止できる。

注意: gcloud commandがインストールされていることを前提にしている。

```bash
bash scripts/gcp_maintenance_stop.sh
```

`error_log.txt`にエラーログが出力された場合は、Google Cloud Consoleを確認の上、対応策を考える。
エラーが出ていてもコンソール上は正常に停止されていることが多い。

### 2. GPU Instance の停止確認

Google Cloud ConsoleでGPU Instanceが停止していることを確認する。
連続起動時間をリセットできれば良いので、理論的には1分程度の停止で問題ないが、稀にGPU Instanceの交換が裏で発生していることがあり得る。(2024/2に経験済み)面倒な事態に遭遇しないためにも、30分〜1時間程度の停止を目安にしておくと良い。

### 3. GPU Instanceの起動

GPU Instanceを起動する。
以下のコマンドで75 nodeのGPU Instanceを起動する。

```bash
bash scripts/gcp_maintenance_start.sh
```

### 4. GPU Instanceが正常に稼働しているか確認

nvidia-smi check & lustre mount

注意: home/scripts/geniac-gcp-setup/setup_lustre.sh がクラスター側にあることを前提としている。

```bash
bash scripts/gcp_maintenance_setup.sh
```
