# Github について

## マルチアカウント

- [同じPCで複数のgithubのアカウントを使う - 役に立ちそうで役に立たないブログ](http://tanjoin.hatenablog.com/entry/2013/11/12/131437)
- [Windows でも Github のマルチアカウント利用がしたい - 役に立ちそうで役に立たないブログ](http://tanjoin.hatenablog.com/entry/2014/06/14/012619)

Windows に関しては Bash on Ubuntu on Windows が登場したのでそちらに環境を構築すると楽かも

- [Bash on Ubuntu on Windowsをインストールしてみよう！ - Qiita](http://qiita.com/Aruneko/items/c79810b0b015bebf30bb)

### tanjoin をサブとして利用するために…

```
.ssh/github/tanjoin/id_rsa
.ssh/github/tanjoin/id_rsa.pub
```

を作成

次に config を書き換える
以下を追記

```
Host tanjoin
 HostName     github.com
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/github/tanjoin/id_rsa
 TCPKeepAlive yes
 IdentitiesOnly yes
```

これで `git clone git@tanjoin:tanjoin/dotfiles.git` で tanjoin アカウントで利用できるようになる

### ユーザーとメールの設定

global に別のアカウントを設定しているとデフォルトがそのアカウント情報になってしまう

そこで

[private_project.sh](private_project.sh)

を利用する

```bash
./private_project.sh dotfiles
```

これでいい感じに設定してくれる
