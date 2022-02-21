# prometheus-playbook

amazon linux をansibleでセットアップするplaybook. protheusをテストする環境のec2、２台をセットアップします。
今はmacから実行してますが、cloudformationで実行する予定

```
# prod.ymlに書いてあるサーバ全台デプロイ
ansible-playbook -i host_vars/prod.yml site.yml

# prod.ymlに書いてあるサーバの中の１台を指定してデプロイ
ansible-playbook -i host_vars/prod.yml -l ec2-3-112-52-187.ap-northeast-1.compute.amazonaws.com site.yml
```

prometheusとtest_httpserverのymlを分けた方がいいのかもしれない。
