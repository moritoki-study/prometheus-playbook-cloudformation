# prometheus-playbook

amazon linux をansibleでセットアップするplaybook. protheusをテストする環境のec2、２台をセットアップします。
cloudformationで実行するploybookです。使わないファイルは全部削除しています
ファイル（ディレクトリかも）が多いとcloudformationの制限にひっかかります。

## 初期セットアップ（スタック作成コマンド）
```
aws cloudformation deploy \
    --template-file vpc-03_cloudfomation_ansible.yml \
    --stack-name test01 \
    --notification-arns arn:aws:sns:ap-northeast-1:1234567890:cloudformation-use-sns-topic \
    --capabilities CAPABILITY_NAMED_IAM
```
- Macから動かしてます。
- awscliは事前に動く状態にしておくこと
- stack-name は任意
- `1234567890`自分のawsアカウントID.１２桁のやつのやつ。UIから見れます。画面右上のアカウントクリック
`--capabilities CAPABILITY_NAMED_IAM` はおそらく、UIでスタック作成するときの最後につけているチェックになると思われる
- stackを削除する前にUIから作ったバケットを空にしておくとスムーズに削除できる
- `notification-arns`はslack通知の設定事前にsns-topicを作っておく必要がある。
- 10分ぐらいかかります。
- https://api.slack.com/apps/A037GAQ0R4G/incoming-webhooks?
- slackurlを直す.stackの作成と共になぜか消えている気がする
```
# git
vi prometheus-playbook-cloudformation/roles/prometheus/file/alertmanager.yml

# serverで修正
sudo vi /etc/prometheus/alertmanager/alertmanager.yml
sudo systemctl restart alertmanager.service

# serverのログ確認
sudo less /var/log/messages
```
- https://slack.com/services/new/incoming-webhook
こっちで作ると消えないのかも

ログ監視用
```
tail -f /var/log/test_httpserver.lo
```

# 初期セットアップ完了後

```
cd prometheus-playbook-cloudformation

# サーバ設定(public dns)
vi host_vars/prod.yml

# ansible実行
ansible-playbook -i host_vars/prod.yml site.yml
```

codeチェック
```
ansible-lint site.yml
```
