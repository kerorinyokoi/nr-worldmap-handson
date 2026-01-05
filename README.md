# GitHub Codespaces用のNode-REDテンプレート

このリポジトリは、GitHub CodespasesでNode-RED 環境を作成するためのテンプレートです。
Codespasesを使用すると、Node-REDフローエディタを一時的に4時間のみ使用できます。
このテンプレートは、ハンズオンイベントや個人的な使用のためにNode-REDを試すのに役立つでしょう。
以下は、このテンプレートの使用方法に関するステップバイステップの手順です。

## 1. GitHubアカウントを作成する

GitHubアカウントを持っていない場合は、以下のURLからGitHubアカウントを作成してください。

https://github.com/signup
   
アカウントに登録するには、メールアドレス、パスワード、ユーザー名などの情報を入力する必要があります。

## 2. GitHub Codespacesのタイムアウト時間を延長する

デフォルトでは、Codespacesが用意した環境は30分で終了します。
この期間はNode-REDフローを開発するには短すぎるため、ユーザの設定URLからタイムアウト時間を延長します。

https://github.com/settings/codespaces#default-idle-timeout-header

テキスト入力エリアに最大値の240分を入力します。

<kbd><img width="640" src="images/default-idle-timeout.png"></kbd>

## 3. GitHub Codespacesに移動する

Node-REDテンプレートリポジトリにアクセスすると、右上隅に「Use this template」という緑色のボタンが表示されます。
このボタンをクリックすると、選択可能な2つのオプションが表示されます。
ここで「Open in a codespace」を選択して、Codespacesでテンプレートリポジトリを開きます。

<img width="350" border="1" src="images/open-codespaces.png">

## 4. Node-REDフローエディタを開く

約1分後、この環境は自動的にNode-REDをダウンロードして起動します。
Node-REDフローエディタを使用する準備が整うと、ダイアログが右下隅にポップアップ表示されます。

<img width="500" src="images/open-in-browser_ja.png">

緑色のボタン「ブラウザーで開く」をクリックすると、ブラウザの別のタブが開き、Node-REDフローエディタが表示されます。
まず、この環境でプロジェクト機能のダイアログを開きます。

<img width="900" border="1" src="images/flow-editor_ja.png">

これで、Node-REDフローエディタですごいフローの開発を始めれるようになりました。

# 画面説明

# はじめてのフロー
ワイヤーを流れるメッセージに文字を設定して、メッセージの内容を確認するフローを作成します。
injectノードとdebugノードをつなぐ

injectノードをダブルクリックして、1列目のプルダウンから「文字列」を選択する。
その後、右側に「hello」を入力する。

デプロイボタンを押して、injectノードの左側のボタンをクリックすると、右側のデバッグタブに「hello」という数値が表示される。
```
[{"id":"72d7fe2270b5f66b","type":"inject","z":"1b5975d7b18049b4","name":"","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"hello","payloadType":"str","x":150,"y":80,"wires":[["83b2097680d53329","ae5f693881cca3da"]]},{"id":"83b2097680d53329","type":"debug","z":"1b5975d7b18049b4","name":"debug 1","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":340,"y":80,"wires":[]}]
```

# ワイヤーを流れるメッセージの確認方法
右側の「フローデバッガ」をクリックして、「無効」スイッチをクリックして「有効」に切り替える。
右側に

# 条件に合致した時に音声を再生
injectノードの出力端子からswitchノード、橙色のtemplateノード、play audioノードを順に置き、ワイヤーで接続する。

switchノードのプロパティでは、「要素に含む」を選択して「hello」を入力する。これによってメッセージに「hello」が含まれる場合にのみ次のノードにメッセージが渡される。

temlateノードには読み上げたい文章として「こんにちは」と記載する。

play audioノードをつなぐ。play audioノードのプロパティでは「TTSボイス」として「Google 日本語 (ja-JP)」を選択する。

```
[{"id":"72d7fe2270b5f66b","type":"inject","z":"1b5975d7b18049b4","name":"","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"hello","payloadType":"str","x":150,"y":80,"wires":[["83b2097680d53329","ae5f693881cca3da"]]},{"id":"83b2097680d53329","type":"debug","z":"1b5975d7b18049b4","name":"debug 1","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":340,"y":80,"wires":[]},{"id":"7abe169ab36a17b0","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"こんにちは","output":"str","x":520,"y":160,"wires":[["0d359c8f5757037b"]]},{"id":"0d359c8f5757037b","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":730,"y":160,"wires":[]},{"id":"ae5f693881cca3da","type":"switch","z":"1b5975d7b18049b4","name":"","property":"payload","propertyType":"msg","rules":[{"t":"cont","v":"hello","vt":"str"}],"checkall":"true","repair":false,"outputs":1,"x":330,"y":160,"wires":[["7abe169ab36a17b0"]]},{"id":"715717cff87ae497","type":"global-config","env":[],"modules":{"node-red-contrib-play-audio":"2.5.0"}}]
```


# 加速度センサのデータを可視化
mqtt-inノードとchartノードをつなぐ



