# https://www.task-notes.com/entry/20170405/1491361200
export GOROOT=/usr/local/go  # goがビルドするときに使うと思われる、作成する
export GOPATH=/ec2-user/go # goの作業ディレクトリ任意、作成する必要がある
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
