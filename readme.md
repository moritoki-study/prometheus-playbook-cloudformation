# prometheus-playbook

amazon linux をansibleでセットアップするplaybook. protheusをテストする環境のec2、２台をセットアップします。
cloudformationで実行するploybookです。使わないファイルは全部削除しています
ファイル（ディレクトリかも）が多いとcloudformationの制限にひっかかります。

## スタック作成コマンド
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
- slackurlを直す.stackの削除と共になぜか消えている気がする
```
vi prometheus-playbook-cloudformation/roles/prometheus/file/alertmanager.yml
```

