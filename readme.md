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

`1234567890`自分のawsアカウントID.１２桁のやつのやつ。UIから見れます。画面右上のアカウントクリック
`--capabilities CAPABILITY_NAMED_IAM` はおそらく、UIでスタック作成するときの最後につけているチェックになると思われる
