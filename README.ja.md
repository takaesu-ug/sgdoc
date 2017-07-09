# Sgdoc

AWSのセキュリティグループをいい感じでドキュメント化してテキスト出力する
デフォルト対応はマークダウンのみ
ipv6関連は未対応
SGを参照しているサービスはEC2,RDS,ELBを対象とする(その他は適宜追加)

## 有効な場面

- セキュリティグループは結構変えることが多い（それにドキュメントをつい付いしていくのが大変なので自動化できると楽）

## やりたいこと

- Erubisに渡してerbテンプレートで展開する
    - ドキュメントにはSecurityGroupの内容
    - 関連付けの情報(EC2, ELB, EC2)
- SecurityGroupのIn,Outのポリシーにコメントを入れれるようにしたい(別ファイルでポートのコメント管理。定型文はYamlで管理(0.0.0.0/0など))

### Credentialは次の順番で有効になる
- (未) `:access_key_id` , `:secret_access_key` , and `:session_token` options
- `ENV['AWS_REGION']`, `ENV['AWS_ACCESS_KEY_ID']`, `ENV['AWS_SECRET_ACCESS_KEY']`
- HOME/.aws/credentials shared credentials file
- EC2 instance profile credentials See Plugins::RequestSigner for more details.


### 実行方法

```
shared credentials file(HOME/.aws/credentials) に設定がある場合
$ sgdoc > sgdoc.md

環境変数を設定して実行
$ AWS_REGION=ap-northeast-1 AWS_ACCESS_KEY_ID=[ACCESS_KEY] AWS_SECRET_ACCESS_KEY=[SECRET_ACCESS_KEY] sgdoc > sgdoc.md

Dockerで実行する
$ docker build . -f Dockerfile -t yusabana/sgdoc
$ docker run --rm -e AWS_REGION=ap-northeast-1 -e AWS_ACCESS_KEY_ID=[ACCESS_KEY] -e AWS_SECRET_ACCESS_KEY=[SECRET_ACCESS_KEY] yusabana/sgdoc sgdoc
```

## Requirements

Ruby 2.1 or higher

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
