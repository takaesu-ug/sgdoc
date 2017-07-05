# Sgdoc

AWSのセキュリティグループをいい感じでドキュメント化してテキスト出力する
デフォルト対応はマークダウンのみ
ipv6関連は未対応
SGを参照しているサービスはEC2,RDS,ELBを対象とする(その他は適宜追加)

## 有効な場面

- セキュリティグループは結構変えることが多い（それにドキュメントをつい付いしていくのが大変なので自動化できると楽）

## やりたいこと

- [ ] aws-sdkで必要な情報を取得してハッシュ化
- [ ] Erubisに渡してerbテンプレートで展開する
    - ドキュメントにはSecurityGroupの内容
    - 関連付けの情報(EC2, ELB, EC2)
- [ ] SecurityGroupのIn,Outのポリシーにコメントを入れれるようにしたい(別ファイルでポートのコメント管理。定型文はYamlで管理(0.0.0.0/0など))


### Credentialは次の順番で有効になる
- (これは設定しないのでいらないかな) `:access_key_id` , `:secret_access_key` , and `:session_token` options
- `ENV['AWS_ACCESS_KEY_ID']`, `ENV['AWS_SECRET_ACCESS_KEY']`
- HOME/.aws/credentials shared credentials file
- EC2 instance profile credentials See Plugins::RequestSigner for more details.

## Requirements

Ruby 2.1 or higher

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
