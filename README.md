# ビジュアルプログラミングを用いて、センサデータや位置情報を可視化するハンズオン
## 学習内容
- 工場の生産ラインや無人搬送車などで使われているビジュアルプログラミングを知る
- 興味をもってもらうため本格的なデータではなく、センサデータや位置情報を扱う
- ソフトウェアエンジニアが扱う条件判定、代入操作、変数、デバッガ、音声合成、GitHub、MQTTなどの技術を知る
- 生成AIによるプログラム作成支援を体験する

# ビジュアルプログラミング環境を作成
このハンズオンでは、Node-REDというビジュアルプログラミング環境を使用します。Node-REDは、ブラウザ上で動作するフローエディタを提供し、ドラッグアンドドロップでノードを配置してワイヤーで接続することで、プログラムを作成できます。
Node-REDを起動するために、GitHub Codespacesを使用します。GitHub Codespacesは、GitHubが提供するクラウドベースの一時的な開発環境です。

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
このページにアクセスすると、右上隅に「Use this template」という緑色のボタンがあります。このボタンをクリックすると、メニューから2つのオプションを選択できます。
ここで「Open in a codespace」を選択して、Codespacesでテンプレートリポジトリを開きます。

<img width="350" border="1" src="images/open-codespaces.png">

## 4. Node-REDフローエディタを開く
約1分後、この環境は自動的にNode-REDをダウンロードして起動します。
Node-REDフローエディタを使用する準備が整うと、ダイアログが右下隅にポップアップ表示されます。

<img width="500" src="images/open-in-browser_ja.png">

緑色のボタン「ブラウザーで開く」をクリックすると、ブラウザの別のタブが開き、Node-REDフローエディタが表示されます。
まず、この環境でプロジェクト機能のダイアログを開きます。

<img width="900" border="1" src="images/flow-editor_ja.png">

これで、Node-REDフローエディタでフローの開発を始めれるようになりました。

# Node-REDフローエディタの画面説明
Node-REDフローエディタの画面は、主に以下の3つの部分で構成されています。
1. パレット（左側）
   - ここには、利用可能なノードの一覧が表示されます。ノードは、特定の機能を持つブロックであり、ドラッグアンドドロップでフローエディタに追加できます。
2. ワークスペース（中央）
    - ここは、ノードを配置してワイヤーで接続する場所です。フローエディタのメインエリアであり、ノードを組み合わせてフローを作成します。
3. サイドバー（右側）
    - ここには、ノードのプロパティやデバッグ情報が表示されます。ノードを選択すると、そのノードの設定を変更できます。また、デバッグタブでは、フローの実行中に生成されたメッセージを確認できます。

# はじめてのフロー
ワイヤーを流れるメッセージに文字を設定して、メッセージの内容を確認するフローを作成します。
ノードパレットからinjectノードとdebugノードをワークスペースにドラッグアンドドロップします。その後、ワイヤーで接続します。

<img width="900" border="1" src="images/firstflow.png">

次にinjectノードをダブルクリックして、1列目のプルダウンから「文字列」を選択します。

<img width="900" border="1" src="images/inject_string.png">

その後、右側に「hello」を入力して、「完了」ボタンをクリックします。

<img width="900" border="1" src="images/inject_hello.png">

デプロイボタンを押して、injectノードの左側のボタンをクリックすると、右側のデバッグタブに「hello」という文字が表示されます。

<img width="900" border="1" src="images/debug_hello.png">

これで、はじめてのフローの作り方が分かりました。

# ワイヤーを流れるメッセージの確認方法
ここでは、ワイヤーを流れるメッセージの内容を確認する方法を説明します。Node-REDにはフローデバッガという機能があり、ワイヤーを流れるメッセージの内容を詳細に確認できます。

<img width="900" border="1" src="images/gemini1.png">

右端にあるアイコン一覧から「フローデバッガ」をクリックします。
すると「無効」スイッチをクリックして「有効」に切り替えます。

<img width="900" border="1" src="images/enable_debugger.png">

injectノードの右側の端子にマウスカーソルを合わせると、青い四角が表示されます。この四角をクリックすると、ブレイクポイントが設定されます。ブレイクポイントとは、ワイヤーを流れるメッセージがその位置で一時停止するポイントです。

<img width="900" border="1" src="images/breakpoint.png">

injectノードの左側のボタンをクリックすると、ワイヤーを流れるメッセージがブレイクポイントで一時停止します。右端のデバッガタブにメッセージの内容が表示されます。

<img width="900" border="1" src="images/debugger_breakpoint.png">

フローの実行を再開するには、ワークスペース上部の上に表示される「フローを再開」ボタンをクリックします。すると、メッセージが次のノードに渡され、デバッグタブにメッセージの内容が表示されます。

<img width="900" border="1" src="images/debugger_continue.png">

これで、ワイヤーを流れるメッセージの内容を確認する方法がわかりました。フローを流れるメッセージを確認しない時は、デバッガタブの「有効」スイッチをクリックして「無効」に切り替えます。

# 条件に合致した時に音声を再生
ここでは、ワイヤーを流れるメッセージの内容に条件分岐を加えて、条件に合致した時に音声を再生するフローを作成します。

<img width="900" border="1" src="images/gemini2.png">

injectノードの出力端子からswitchノード、橙色のtemplateノード、play audioノードを順に置き、ワイヤーで接続します。

<img width="900" border="1" src="images/voice_flow.png">

switchノードは条件分岐を行うノードです。switchノードのダブルクリックするとプロパティが表示されます。プロパティでは「要素に含む」を選択して「hello」を入力します。

<img width="900" border="1" src="images/switch_properties.png">
<img width="900" border="1" src="images/switch_hello.png">

これによってメッセージに「hello」が含まれる場合にのみ次のノードにメッセージが渡されるようになります。

temlateノードは、定型文のメッセージを記入するノードです。templateノードのプロパティには読み上げたい文章として「こんにちは」と記載します。

<img width="900" border="1" src="images/template_hello.png">

play audioノードは音声を再生するノードです。デプロイボタンを押してからinjectノードの左側のボタンをクリックすると、「こんにちは」という音声が再生されます。

<img width="900" border="1" src="images/play_audio.png">

もし再生されない場合は、play audioノードのプロパティでは「TTSボイス」として「Google 日本語 (ja-JP)」を選択してみてください。

# 加速度センサのデータを可視化
ここでは、MQTTプロトコルで送信される加速度センサのデータを可視化するフローを作成します。MQTTはIoTデバイスでよく使われる軽量な通信プロトコルです。加速度センサのデータは、MQTTブローカーであるshiftr.ioのパブリックブローカーから取得します。
<img width="900" border="1" src="images/gemini3.png">

パレットのmqtt-inノード(右側に端子があるノード)とchartノードをつなぎます。

- サーバ
```
mqtt://public:public@public.cloud.shiftr.io
```
- トピック
```
nodered
```

# 異常値の時に音声で通知するフロー

# 地図上に現在地を表示するフロー
mqtt inノードとworldmapノードをつなぐ。

# 空港に到着したら音声で通知するフロー
mqtt inノードの後ろにgeo fenceノード、templateノード、play audioノードを接続する。

# 空港の位置情報を送信するフロー

# 飛行機の位置情報を地図上に可視化するフロー

- 緯度(南端): 32
- 経度(西端): 136
- 緯度(北端): 37
- 経度(東端): 140

# 飛行機が近づいてきたら通知するフロー

https://chatgpt.com/

```
Node-REDのfunctionノードに書くソースコードを作成してください。入力として緯度msg.payload.latと経度msg.payload.lonが与えられます。この緯度と経度を使い、江南市役所を基準点とした距離を算出してください。ルールは次のとおりです。
- 距離の計算にはHaversine式を用いる
- 距離は小数は使わず、四捨五入して整数にする
- 出力msg.payloadには「○kmです」（例：15kmです）という形式で距離を入れる
- 変数の名前は半角英文字にする
```

[https://chatgpt.com/share/695b700a-2148-8009-bef4-416a6304d238](https://chatgpt.com/share/695b750f-3608-8009-8713-6d73c3e92e7b)

# フローデータ
## はじめてのフロー
```
[{"id":"72d7fe2270b5f66b","type":"inject","z":"1b5975d7b18049b4","name":"","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"hello","payloadType":"str","x":150,"y":80,"wires":[["83b2097680d53329","ae5f693881cca3da"]]},{"id":"83b2097680d53329","type":"debug","z":"1b5975d7b18049b4","name":"debug 1","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":340,"y":80,"wires":[]}]
```

## 条件に合致した時に音声を再生するフロー
```
[{"id":"72d7fe2270b5f66b","type":"inject","z":"1b5975d7b18049b4","name":"","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"hello","payloadType":"str","x":150,"y":80,"wires":[["83b2097680d53329","ae5f693881cca3da"]]},{"id":"83b2097680d53329","type":"debug","z":"1b5975d7b18049b4","name":"debug 1","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":340,"y":80,"wires":[]},{"id":"7abe169ab36a17b0","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"こんにちは","output":"str","x":520,"y":160,"wires":[["0d359c8f5757037b"]]},{"id":"0d359c8f5757037b","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":730,"y":160,"wires":[]},{"id":"ae5f693881cca3da","type":"switch","z":"1b5975d7b18049b4","name":"","property":"payload","propertyType":"msg","rules":[{"t":"cont","v":"hello","vt":"str"}],"checkall":"true","repair":false,"outputs":1,"x":330,"y":160,"wires":[["7abe169ab36a17b0"]]},{"id":"715717cff87ae497","type":"global-config","env":[],"modules":{"node-red-contrib-play-audio":"2.5.0"}}]
```

## 加速度センサのデータを可視化するフロー
```
[{"id":"5b10f523b8853031","type":"mqtt in","z":"1b5975d7b18049b4","name":"","topic":"nodered","qos":"2","datatype":"auto-detect","broker":"2763ca9abd118f91","nl":false,"rap":true,"rh":0,"inputs":0,"x":140,"y":280,"wires":[["b0ad962c7274e22c"]]},{"id":"037928665c2fd0ae","type":"ui-chart","z":"1b5975d7b18049b4","group":"72f5ef6cebd783c0","name":"","label":"chart","order":1,"chartType":"line","category":"topic","categoryType":"msg","xAxisLabel":"","xAxisProperty":"","xAxisPropertyType":"timestamp","xAxisType":"time","xAxisFormat":"","xAxisFormatType":"auto","xmin":"","xmax":"","yAxisLabel":"","yAxisProperty":"payload","yAxisPropertyType":"msg","ymin":"","ymax":"","bins":10,"action":"append","stackSeries":false,"pointShape":"circle","pointRadius":4,"showLegend":true,"removeOlder":1,"removeOlderUnit":"3600","removeOlderPoints":"","colors":["#0095ff","#ff0000","#ff7f0e","#2ca02c","#a347e1","#d62728","#ff9896","#9467bd","#c5b0d5"],"textColor":["#666666"],"textColorDefault":true,"gridColor":["#e5e5e5"],"gridColorDefault":true,"width":6,"height":8,"className":"","interpolation":"linear","x":570,"y":280,"wires":[[]]},{"id":"b0ad962c7274e22c","type":"change","z":"1b5975d7b18049b4","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"payload.acceleration.z","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":280,"wires":[["037928665c2fd0ae","1fd3746353b29820"]]},{"id":"2763ca9abd118f91","type":"mqtt-broker","name":"","broker":"mqtt://public:public@public.cloud.shiftr.io","port":1883,"clientid":"","autoConnect":true,"usetls":false,"protocolVersion":4,"keepalive":60,"cleansession":true,"autoUnsubscribe":true,"birthTopic":"","birthQos":"0","birthRetain":"false","birthPayload":"","birthMsg":{},"closeTopic":"","closeQos":"0","closeRetain":"false","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willRetain":"false","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""},{"id":"72f5ef6cebd783c0","type":"ui-group","name":"Group 1","page":"3bff4b21dc58d216","width":6,"height":1,"order":1,"showTitle":true,"className":"","visible":true,"disabled":false,"groupType":"default"},{"id":"3bff4b21dc58d216","type":"ui-page","name":"Page 1","ui":"3516d5993ef2e8fe","path":"/page1","icon":"home","layout":"grid","theme":"c22cc61de3b17959","breakpoints":[{"name":"Default","px":0,"cols":3},{"name":"Tablet","px":576,"cols":6},{"name":"Small Desktop","px":768,"cols":9},{"name":"Desktop","px":1024,"cols":12}],"order":1,"className":"","visible":"true","disabled":"false"},{"id":"3516d5993ef2e8fe","type":"ui-base","name":"My Dashboard","path":"/dashboard","appIcon":"","includeClientData":true,"acceptsClientConfig":["ui-notification","ui-control"],"showPathInSidebar":false,"headerContent":"page","navigationStyle":"default","titleBarStyle":"default","showReconnectNotification":true,"notificationDisplayTime":1,"showDisconnectNotification":true,"allowInstall":false},{"id":"c22cc61de3b17959","type":"ui-theme","name":"Default Theme","colors":{"surface":"#ffffff","primary":"#0094CE","bgPage":"#eeeeee","groupBg":"#ffffff","groupOutline":"#cccccc"},"sizes":{"density":"default","pagePadding":"12px","groupGap":"12px","groupBorderRadius":"4px","widgetGap":"12px"}},{"id":"f3f1083498e76ad4","type":"global-config","env":[],"modules":{"@flowfuse/node-red-dashboard":"1.30.1"}}]
```

# 異常値の時に音声で通知するフロー
```
[{"id":"5b10f523b8853031","type":"mqtt in","z":"1b5975d7b18049b4","name":"","topic":"nodered","qos":"2","datatype":"auto-detect","broker":"2763ca9abd118f91","nl":false,"rap":true,"rh":0,"inputs":0,"x":140,"y":280,"wires":[["b0ad962c7274e22c"]]},{"id":"037928665c2fd0ae","type":"ui-chart","z":"1b5975d7b18049b4","group":"72f5ef6cebd783c0","name":"","label":"chart","order":1,"chartType":"line","category":"topic","categoryType":"msg","xAxisLabel":"","xAxisProperty":"","xAxisPropertyType":"timestamp","xAxisType":"time","xAxisFormat":"","xAxisFormatType":"auto","xmin":"","xmax":"","yAxisLabel":"","yAxisProperty":"payload","yAxisPropertyType":"msg","ymin":"","ymax":"","bins":10,"action":"append","stackSeries":false,"pointShape":"circle","pointRadius":4,"showLegend":true,"removeOlder":1,"removeOlderUnit":"3600","removeOlderPoints":"","colors":["#0095ff","#ff0000","#ff7f0e","#2ca02c","#a347e1","#d62728","#ff9896","#9467bd","#c5b0d5"],"textColor":["#666666"],"textColorDefault":true,"gridColor":["#e5e5e5"],"gridColorDefault":true,"width":6,"height":8,"className":"","interpolation":"linear","x":570,"y":280,"wires":[[]]},{"id":"b0ad962c7274e22c","type":"change","z":"1b5975d7b18049b4","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"payload.acceleration.z","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":280,"wires":[["037928665c2fd0ae","1fd3746353b29820"]]},{"id":"7b16d32c3a9fe2cc","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"異常値です","output":"str","x":520,"y":360,"wires":[["262515923e512e88"]]},{"id":"262515923e512e88","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":730,"y":360,"wires":[]},{"id":"1fd3746353b29820","type":"switch","z":"1b5975d7b18049b4","name":"","property":"payload","propertyType":"msg","rules":[{"t":"gt","v":"10","vt":"num"}],"checkall":"true","repair":false,"outputs":1,"x":330,"y":360,"wires":[["7b16d32c3a9fe2cc"]]},{"id":"2763ca9abd118f91","type":"mqtt-broker","name":"","broker":"mqtt://public:public@public.cloud.shiftr.io","port":1883,"clientid":"","autoConnect":true,"usetls":false,"protocolVersion":4,"keepalive":60,"cleansession":true,"autoUnsubscribe":true,"birthTopic":"","birthQos":"0","birthRetain":"false","birthPayload":"","birthMsg":{},"closeTopic":"","closeQos":"0","closeRetain":"false","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willRetain":"false","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""},{"id":"72f5ef6cebd783c0","type":"ui-group","name":"Group 1","page":"3bff4b21dc58d216","width":6,"height":1,"order":1,"showTitle":true,"className":"","visible":true,"disabled":false,"groupType":"default"},{"id":"3bff4b21dc58d216","type":"ui-page","name":"Page 1","ui":"3516d5993ef2e8fe","path":"/page1","icon":"home","layout":"grid","theme":"c22cc61de3b17959","breakpoints":[{"name":"Default","px":0,"cols":3},{"name":"Tablet","px":576,"cols":6},{"name":"Small Desktop","px":768,"cols":9},{"name":"Desktop","px":1024,"cols":12}],"order":1,"className":"","visible":"true","disabled":"false"},{"id":"3516d5993ef2e8fe","type":"ui-base","name":"My Dashboard","path":"/dashboard","appIcon":"","includeClientData":true,"acceptsClientConfig":["ui-notification","ui-control"],"showPathInSidebar":false,"headerContent":"page","navigationStyle":"default","titleBarStyle":"default","showReconnectNotification":true,"notificationDisplayTime":1,"showDisconnectNotification":true,"allowInstall":false},{"id":"c22cc61de3b17959","type":"ui-theme","name":"Default Theme","colors":{"surface":"#ffffff","primary":"#0094CE","bgPage":"#eeeeee","groupBg":"#ffffff","groupOutline":"#cccccc"},"sizes":{"density":"default","pagePadding":"12px","groupGap":"12px","groupBorderRadius":"4px","widgetGap":"12px"}},{"id":"d2df665065ed2b1b","type":"global-config","env":[],"modules":{"@flowfuse/node-red-dashboard":"1.30.1","node-red-contrib-play-audio":"2.5.0"}}]
```

## 地図上に現在地を表示するフロー
```
[{"id":"2a274d1d46e2aa41","type":"worldmap","z":"1b5975d7b18049b4","name":"","lat":"","lon":"","zoom":"","layer":"OSMG","cluster":"","maxage":"","usermenu":"show","layers":"show","panit":"false","panlock":"false","zoomlock":"false","hiderightclick":"false","coords":"none","showgrid":"false","showruler":"false","allowFileDrop":"false","path":"/worldmap","overlist":"DR,CO,RA,DN","maplist":"OSMG,OSMC,EsriC,EsriS,UKOS","mapname":"","mapurl":"","mapopt":"","mapwms":false,"x":340,"y":460,"wires":[]},{"id":"a0608c665dfc2a9b","type":"mqtt in","z":"1b5975d7b18049b4","name":"","topic":"nodered","qos":"2","datatype":"auto-detect","broker":"2763ca9abd118f91","nl":false,"rap":true,"rh":0,"inputs":0,"x":140,"y":460,"wires":[["2a274d1d46e2aa41"]]},{"id":"2763ca9abd118f91","type":"mqtt-broker","name":"","broker":"mqtt://public:public@public.cloud.shiftr.io","port":1883,"clientid":"","autoConnect":true,"usetls":false,"protocolVersion":4,"keepalive":60,"cleansession":true,"autoUnsubscribe":true,"birthTopic":"","birthQos":"0","birthRetain":"false","birthPayload":"","birthMsg":{},"closeTopic":"","closeQos":"0","closeRetain":"false","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willRetain":"false","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""},{"id":"c007dca5332bb2ce","type":"global-config","env":[],"modules":{"node-red-contrib-web-worldmap":"5.5.4"}}]
```

## 空港に到着したら音声で通知するフロー
```
[{"id":"2a274d1d46e2aa41","type":"worldmap","z":"1b5975d7b18049b4","name":"","lat":"","lon":"","zoom":"","layer":"OSMG","cluster":"","maxage":"","usermenu":"show","layers":"show","panit":"false","panlock":"false","zoomlock":"false","hiderightclick":"false","coords":"none","showgrid":"false","showruler":"false","allowFileDrop":"false","path":"/worldmap","overlist":"DR,CO,RA,DN","maplist":"OSMG,OSMC,EsriC,EsriS,UKOS","mapname":"","mapurl":"","mapopt":"","mapwms":false,"x":340,"y":460,"wires":[]},{"id":"1e7e59f0387d05e2","type":"geofence","z":"1b5975d7b18049b4","name":"","mode":"circle","inside":"true","rad":2681.1849674706204,"points":[],"centre":{"latitude":34.86145232139244,"longitude":136.81051522493362},"floor":"","ceiling":"","worldmap":false,"outputs":1,"x":340,"y":540,"wires":[["0a7654568a74a6c6"]]},{"id":"a0608c665dfc2a9b","type":"mqtt in","z":"1b5975d7b18049b4","name":"","topic":"nodered","qos":"2","datatype":"auto-detect","broker":"2763ca9abd118f91","nl":false,"rap":true,"rh":0,"inputs":0,"x":140,"y":460,"wires":[["2a274d1d46e2aa41","1e7e59f0387d05e2"]]},{"id":"0a7654568a74a6c6","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"空港に到着しました","output":"str","x":540,"y":540,"wires":[["ae872a5a1e0094d7"]]},{"id":"ae872a5a1e0094d7","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":750,"y":540,"wires":[]},{"id":"2763ca9abd118f91","type":"mqtt-broker","name":"","broker":"mqtt://public:public@public.cloud.shiftr.io","port":1883,"clientid":"","autoConnect":true,"usetls":false,"protocolVersion":4,"keepalive":60,"cleansession":true,"autoUnsubscribe":true,"birthTopic":"","birthQos":"0","birthRetain":"false","birthPayload":"","birthMsg":{},"closeTopic":"","closeQos":"0","closeRetain":"false","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willRetain":"false","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""},{"id":"bdb0c5dd45b960d0","type":"global-config","env":[],"modules":{"node-red-contrib-web-worldmap":"5.5.4","node-red-node-geofence":"0.3.4","node-red-contrib-play-audio":"2.5.0"}}]
```

## 空港の位置情報を送信するフロー
```
[{"id":"b365fa8f6e5a9533","type":"inject","z":"1b5975d7b18049b4","name":"","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","crontab":"","once":false,"onceDelay":0.1,"topic":"","payload":"","payloadType":"date","x":160,"y":640,"wires":[["cd773b4c174a7f83"]]},{"id":"cd773b4c174a7f83","type":"template","z":"1b5975d7b18049b4","name":"セントレアの位置情報","field":"payload","fieldType":"msg","format":"json","syntax":"mustache","template":"{\n    \"name\": 1767597374755,\n    \"lat\": 34.858333,\n    \"lon\": 136.805278\n}","output":"json","x":420,"y":640,"wires":[["5d72663e8f26c4cc"]]},{"id":"5d72663e8f26c4cc","type":"mqtt out","z":"1b5975d7b18049b4","name":"","topic":"nodered","qos":"","retain":"","respTopic":"","contentType":"","userProps":"","correl":"","expiry":"","broker":"2763ca9abd118f91","x":660,"y":640,"wires":[]},{"id":"2763ca9abd118f91","type":"mqtt-broker","name":"","broker":"mqtt://public:public@public.cloud.shiftr.io","port":1883,"clientid":"","autoConnect":true,"usetls":false,"protocolVersion":4,"keepalive":60,"cleansession":true,"autoUnsubscribe":true,"birthTopic":"","birthQos":"0","birthRetain":"false","birthPayload":"","birthMsg":{},"closeTopic":"","closeQos":"0","closeRetain":"false","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willRetain":"false","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""}]
```

## 飛行機の位置情報を地図上に可視化するフロー
```
[{"id":"c18bcf7b91cefc8e","type":"opensky-network","z":"1b5975d7b18049b4","method":"allStateVectors","allStateVectors_lamin":"32","allStateVectors_laminType":"num","allStateVectors_lomin":"136","allStateVectors_lominType":"num","allStateVectors_lamax":"37","allStateVectors_lamaxType":"num","allStateVectors_lomax":"140","allStateVectors_lomaxType":"num","name":"","x":160,"y":740,"wires":[["578cb03a408b5d01","e8f2bedf68d0baa8"]]},{"id":"578cb03a408b5d01","type":"worldmap","z":"1b5975d7b18049b4","name":"","lat":"","lon":"","zoom":"","layer":"OSMG","cluster":"","maxage":"","usermenu":"show","layers":"show","panit":"false","panlock":"false","zoomlock":"false","hiderightclick":"false","coords":"none","showgrid":"false","showruler":"false","allowFileDrop":"false","path":"/worldmap","overlist":"DR,CO,RA,DN","maplist":"OSMG,OSMC,EsriC,EsriS,UKOS","mapname":"","mapurl":"","mapopt":"","mapwms":false,"x":380,"y":740,"wires":[]},{"id":"4c38151797394b4b","type":"global-config","env":[],"modules":{"node-red-contrib-opensky-network":"0.1.0","node-red-contrib-web-worldmap":"5.5.4"}}]
```

## 飛行機が近づいてきたら通知するフロー
```
[{"id":"c18bcf7b91cefc8e","type":"opensky-network","z":"1b5975d7b18049b4","method":"allStateVectors","allStateVectors_lamin":"32","allStateVectors_laminType":"num","allStateVectors_lomin":"136","allStateVectors_lominType":"num","allStateVectors_lamax":"37","allStateVectors_lamaxType":"num","allStateVectors_lomax":"140","allStateVectors_lomaxType":"num","name":"","x":160,"y":740,"wires":[["578cb03a408b5d01","e8f2bedf68d0baa8"]]},{"id":"578cb03a408b5d01","type":"worldmap","z":"1b5975d7b18049b4","name":"","lat":"","lon":"","zoom":"","layer":"OSMG","cluster":"","maxage":"","usermenu":"show","layers":"show","panit":"false","panlock":"false","zoomlock":"false","hiderightclick":"false","coords":"none","showgrid":"false","showruler":"false","allowFileDrop":"false","path":"/worldmap","overlist":"DR,CO,RA,DN","maplist":"OSMG,OSMC,EsriC,EsriS,UKOS","mapname":"","mapurl":"","mapopt":"","mapwms":false,"x":380,"y":740,"wires":[]},{"id":"e8f2bedf68d0baa8","type":"geofence","z":"1b5975d7b18049b4","name":"","mode":"circle","inside":"true","rad":25701.722600610876,"points":[],"centre":{"latitude":35.3220585123033,"longitude":136.77568674087524},"floor":"","ceiling":"","worldmap":false,"outputs":1,"x":380,"y":820,"wires":[["99bc2f9b5dfb5d5a"]]},{"id":"99bc2f9b5dfb5d5a","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"飛行機がもうすぐ来るよ","output":"str","x":580,"y":820,"wires":[["baf2f603d95e7246"]]},{"id":"baf2f603d95e7246","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":790,"y":820,"wires":[]},{"id":"0cbc2a31fb4b76b5","type":"global-config","env":[],"modules":{"node-red-contrib-opensky-network":"0.1.0","node-red-contrib-web-worldmap":"5.5.4","node-red-node-geofence":"0.3.4","node-red-contrib-play-audio":"2.5.0"}}]
```

## 全てのフロー
```
[{"id":"c18bcf7b91cefc8e","type":"opensky-network","z":"1b5975d7b18049b4","method":"allStateVectors","allStateVectors_lamin":"32","allStateVectors_laminType":"num","allStateVectors_lomin":"136","allStateVectors_lominType":"num","allStateVectors_lamax":"37","allStateVectors_lamaxType":"num","allStateVectors_lomax":"140","allStateVectors_lomaxType":"num","name":"","x":160,"y":740,"wires":[["578cb03a408b5d01","e8f2bedf68d0baa8"]]},{"id":"578cb03a408b5d01","type":"worldmap","z":"1b5975d7b18049b4","name":"","lat":"","lon":"","zoom":"","layer":"OSMG","cluster":"","maxage":"","usermenu":"show","layers":"show","panit":"false","panlock":"false","zoomlock":"false","hiderightclick":"false","coords":"none","showgrid":"false","showruler":"false","allowFileDrop":"false","path":"/worldmap","overlist":"DR,CO,RA,DN","maplist":"OSMG,OSMC,EsriC,EsriS,UKOS","mapname":"","mapurl":"","mapopt":"","mapwms":false,"x":380,"y":740,"wires":[]},{"id":"922cf11b31c43851","type":"function","z":"1b5975d7b18049b4","name":"function 1","func":"// 基準点（江南市役所）の座標\nvar baseLat = 35.33208;\nvar baseLon = 136.87067;\n\n// 入力緯度経度\nvar lat1 = parseFloat(msg.payload.lat);\nvar lon1 = parseFloat(msg.payload.lon);\n\n// Haversine 式による距離計算（地球半径 = 6371km）\nvar toRad = function(deg) {\n    return deg * Math.PI / 180;\n};\n\nvar dLat = toRad(baseLat - lat1);\nvar dLon = toRad(baseLon - lon1);\n\nvar a = Math.sin(dLat/2) * Math.sin(dLat/2) +\n        Math.cos(toRad(lat1)) * Math.cos(toRad(baseLat)) *\n        Math.sin(dLon/2) * Math.sin(dLon/2);\n\nvar c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));\nvar distanceKm = 6371 * c;\n\n// 四捨五入して整数にする\nvar distRounded = Math.round(distanceKm);\n\n// 出力 msg.payload\nmsg.payload = distRounded + \"kmです\";\n\nreturn msg;\n","outputs":1,"timeout":0,"noerr":0,"initialize":"","finalize":"","libs":[],"x":580,"y":900,"wires":[["e242e896c8a9947d"]]},{"id":"e8f2bedf68d0baa8","type":"geofence","z":"1b5975d7b18049b4","name":"","mode":"circle","inside":"true","rad":25701.722600610876,"points":[],"centre":{"latitude":35.3220585123033,"longitude":136.77568674087524},"floor":"","ceiling":"","worldmap":false,"outputs":1,"x":380,"y":820,"wires":[["922cf11b31c43851","99bc2f9b5dfb5d5a"]]},{"id":"99bc2f9b5dfb5d5a","type":"template","z":"1b5975d7b18049b4","name":"","field":"payload","fieldType":"msg","format":"handlebars","syntax":"mustache","template":"飛行機がもうすぐ来るよ","output":"str","x":580,"y":820,"wires":[["baf2f603d95e7246"]]},{"id":"baf2f603d95e7246","type":"play audio","z":"1b5975d7b18049b4","d":true,"name":"","voice":"190","x":790,"y":820,"wires":[]},{"id":"e242e896c8a9947d","type":"play audio","z":"1b5975d7b18049b4","name":"","voice":"190","x":790,"y":900,"wires":[]},{"id":"182865a9d2746af9","type":"global-config","env":[],"modules":{"node-red-contrib-opensky-network":"0.1.0","node-red-contrib-web-worldmap":"5.5.4","node-red-node-geofence":"0.3.4","node-red-contrib-play-audio":"2.5.0"}}]
```
