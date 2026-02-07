# ビジュアルプログラミングを用いて、センサデータや位置情報を可視化するハンズオン

## 学習内容
- 工場の生産ラインや無人搬送車などで使われているビジュアルプログラミングを知る
- 難しい業務データではなく、スマホのセンサや飛行機の位置など、身近で面白いデータを扱う
- ソフトウェアエンジニアが扱う条件判定、代入操作、変数、デバッガ、音声合成、GitHub、MQTTなどの技術を知る
- 生成AIによるプログラム作成支援を体験する

<img width="500" border="1" src="images/gemini_top.png">

# ビジュアルプログラミング環境を準備
このハンズオンでは、Node-REDというビジュアルプログラミング環境を使用します。Node-REDは、ブラウザ上で動作するフローエディタを提供し、ドラッグアンドドロップでノードを配置してワイヤーで接続することで、プログラムを作成できます。
Node-REDを起動するために、GitHub[^1] Codespacesを使用します。GitHub Codespacesは、GitHubが提供するクラウドベースの一時的な開発環境です。

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

<img width="900" border="1" src="images/flow-editor_ja.png">

これで、Node-REDフローエディタでフローの開発を始められるようになりました。

# Node-REDフローエディタの画面説明
Node-REDフローエディタの画面は、主に以下の3つの部分で構成されています。
1. パレット（左側）
   - ここには、利用可能なノードの一覧が表示されます。ノードは、特定の機能を持つブロックであり、ドラッグ＆ドロップでフローエディタに追加できます。
2. ワークスペース（中央）
    - ここは、ノードを配置してワイヤーで接続する場所です。フローエディタのメインエリアであり、ノードを組み合わせてフローを作成します。
3. サイドバー（右側）
    - ここには、ノードのプロパティやデバッグ情報が表示されます。

# 音声を再生するフローを作ってみよう
初めてのフローとして、音声を再生するフローを作成します。

<img width="900" border="1" src="images/gemini0.png">

## 1. フローの作成
左側のパレットから、以下の3つのノードを探して中央のワークスペースにドラッグアンドドロップして置きます。

- injectノード
- 橙色のtemplateノード
- play audioノード

その後、それぞれのノードの出力端子から入力端子へワイヤーで接続します。

<img width="900" border="1" src="images/firstflow.png">

injectノードは、フローを開始するノードで、ワークスペースに上に置くと名前が「タイムスタンプ」に変わります。templateノードは、定型文のメッセージを記入するノードです。play audioノードは音声を再生するノードです。

## 2. templateノードの設定
まず、templateノードをダブルクリックして、プロパティ設定画面を開きます。プロパティ設定画面ではノード固有の設定を行えます。templateノードのプロパティでは、テキストエディタの部分に読み上げたい文章として「こんにちは」を入力して、「完了」ボタンをクリックします。

<img width="900" border="1" src="images/template_hello.png">

右上のデプロイボタンを押してフローを有効にします。フローを変更した場合は、デプロイボタンが赤色になるため、再度押して変更を反映する必要があります。

<img width="900" border="1" src="images/deploy_button.png">

## 3. 音声の再生
「タイムスタンプ」という名前が付いているinjectノードの左側のボタンをクリックすると、「こんにちは」という音声が再生されます。

<img width="900" border="1" src="images/play_audio.png">

もし再生されない場合は、play audioノードのプロパティでは「TTSボイス」として「Google 日本語 (ja-JP)」を選択してみてください。また、PCのボリュームが小さくないかも確認してみてください。

# ワイヤーを流れるメッセージの確認方法
ここでは、ワイヤーを流れるメッセージの内容を確認する方法を説明します。Node-REDにはフローデバッガという機能があり、ワイヤーを流れるメッセージの内容を詳細に確認できます。

<img width="900" border="1" src="images/gemini1.png">

## 1. フローデバッガの有効化
右端にあるアイコン一覧から「フローデバッガ」をクリックします。その後「無効」スイッチをクリックして「有効」に切り替えます。

<img width="900" border="1" src="images/enable_debugger.png">

## 2. ブレイクポイントの設定
templateノードの右側の端子にマウスカーソルを合わせると、青い四角が表示されます。この四角をクリックすると、ブレイクポイントが設定できます。ブレイクポイントとは、ワイヤーを流れるメッセージがその位置で一時停止するポイントです。

<img width="900" border="1" src="images/breakpoint.png">

## 3. メッセージ内容の確認
injectノードの左側のボタンをクリックすると、ワイヤーを流れるメッセージがブレイクポイントで一時停止します。右端のデバッガタブにメッセージの内容が表示されます。

<img width="900" border="1" src="images/debugger_breakpoint.png">

フローの実行を再開するには、ワークスペース上部の上に表示される「フローを再開」ボタンをクリックします。すると、メッセージが次のノードに渡され、音声が再生されます。

<img width="900" border="1" src="images/debugger_continue.png">

これで、ワイヤーを流れるメッセージの内容を確認する方法がわかりました。フローを流れるメッセージを確認しない時は、デバッガタブの「有効」スイッチをクリックして「無効」に切り替えます。

# 加速度センサのデータを可視化
ここでは、MQTTプロトコルで送信される加速度センサのデータを可視化するフローを作成します。MQTTはIoTデバイスでよく使われる軽量な通信プロトコルです。加速度センサのデータは、MQTTブローカーであるshiftr.ioのパブリックブローカーから取得します。

<img width="900" border="1" src="images/gemini3.png">

## 1. フローの作成
パレットのmqtt-inノード(右側に端子があるノード)、changeノード、chartノードを順につなぎます。

<img width="900" border="1" src="images/mqtt_chart_flow.png">

changeノードは、ワークスペースに配置すると名前が「set msg.payload」に変わります。

## 2. mqtt-inノードのプロパティ設定
mqtt-inノードはMQTTブローカーからセンサーデータのメッセージを受信するノードです。
まずmqtt-inノードのプロパティを開き、以下のようにトピックを設定します。

- トピック:
  ```
  nodered
  ```

  <img width="900" border="1" src="images/mqtt_in_properties.png">

「サーバ」の鉛筆アイコンの隣にあるプラスボタン(マウスカーソルを上に載せると「新規にmqtt-broker 設定ノードを追加」と表示される)をクリックして、新しいMQTTブローカーを追加します。

<img width="900" border="1" src="images/mqtt_broker_add.png">

サーバの欄に以下のMQTTブローカーのURLを入力します。

- サーバ:
  ```
  mqtt://public:public@public.cloud.shiftr.io
  ```

  <img width="900" border="1" src="images/mqtt_broker_properties.png">

右上の「追加」ボタンをクリックして、mqtt-inノードのプロパティに戻ります。最後に「完了」ボタンをクリックします。

## 3. changeノードのプロパティ設定
changeノードは、メッセージの中から必要なデータだけを取り出すノードです。「set msg.payload」という名前が付いているchangeノードのプロパティを開き、以下のように設定します。

- 2行目の「代入する値」の「az」をクリックして「msg.」を選択
- 右側の入力欄に以下を入力
  ```
  payload.acceleration.z
  ```

  <img width="900" border="1" src="images/change_node_properties.png">

payload.acceleration.zは、MQTTブローカーから受信したメッセージの中から加速度センサのZ軸の値を取り出すためのパスです。payloadという箱の中にaccelerationという箱があり、その中にzという値が入っているイメージです。

<img width="900" border="1" src="images/variable.png">

## 4. フローの実行とダッシュボード画面の動作確認
完了ボタンをクリックしてプロパティを閉じます。これで、MQTTブローカーから受信したメッセージの中から加速度センサのZ軸の値だけをmsg.payloadに代入するようになります。

chartノードは、メッセージの内容をグラフで可視化するノードです。chartノードはプロパティを変更する必要はありません。

デプロイボタンを押してフローを有効にします。右側の「ダッシュボード2.0」タブを開き、「ダッシュボードを開く」ボタンをクリックします。

<img width="900" border="1" src="images/open_dashboard.png">

新しいタブが開き、加速度センサのZ軸の値がグラフで表示されます。

<img width="900" border="1" src="images/acceleration_chart.png">

これで、加速度センサのデータを可視化するフローが完成しました。
もしご自身のスマートフォンで試したい場合は、スマートフォンから[このIoT PhoneアプリのURL](https://kazuhitoyokoi.github.io/iot-phone/)にアクセスして、トピック名として一意の名前(nodered451など)を入力して、センサーデータを送信してみてください。

# 異常値の時に音声で通知するフロー
加速度センサのZ軸の値が10を超えた場合に音声で通知するフローを作成します。

<img width="900" border="1" src="images/gemini4.png">

## 1. フローの作成
changeノードの出力端子からswitchノード、templateノード、play audioノードを順に置き、<!-- 画像のように-->ワイヤーで接続します。

<img width="900" border="1" src="images/abnormal_voice_flow.png">

## 2. switchノードに条件を設定
switchノードは条件分岐を行うノードです。switchノードをダブルクリックするとプロパティが表示されます。プロパティでは「10より大きい」の条件を追加します。

- 「==」をクリックして「>」を選択

  <img width="900" border="1" src="images/switch_gt10.png">

- 文字列「az」をクリックして数値「09」を選択
<!-- 「数値「09」」→「「数値09」」の方がいい -->
  <img width="900" border="1" src="images/switch_property_msg.png">

- 右側の入力欄に「10」と入力

  <img width="900" border="1" src="images/switch_value_10.png">

これでメッセージに値が異常の場合にのみ次のノードにメッセージが渡されるようになります。

## 3. templateノードに読み上げる文章を設定
templateノードは、定型文のメッセージを記入するノードです。templateノードのプロパティには読み上げたい文章として「異常な値です」と記載します。

<img width="900" border="1" src="images/template_abnormal.png">

## 4. デプロイボタンを押してフローを実行
デプロイボタンを押してから、MQTTブローカーに加速度センサのZ軸の値が10を超えるメッセージを送信すると、「異常な値です」という音声が再生されます。

# 地図上に現在地を表示するフロー
ここでは、MQTTプロトコルで送信されるスマホのGPS情報を地図上に表示するフローを作成します。

<img width="900" border="1" src="images/gemini5.png">

## 1. フローを作成
前のフローからmqtt inノードのみを選択してControl+Cを押してコピーして、既存のフローの下にControl+Vを押して貼り付けます(本説明のスクリーンショットには前のフローは入っていません)。
<!-- 「mqtt in」→「nodered」の方がいい -->
worldmapノードをmqtt-inノードの後ろに置き、ワイヤーでつなぎます。

<img width="900" border="1" src="images/map_flow.png">

## 2. フローをデプロイして、地図を表示
デプロイボタンを押してフローを有効にします。デプロイボタンの左側にある「Open world map」ボタンをクリックして、地図を表示します。

<img width="900" border="1" src="images/world_map.png">

左上のマイナスボタンで地図を縮小して地図を日本に移動させると、スマホのGPS情報が地図上に表示されます。

# 空港に到着したら音声で通知するフロー
ここでは、スマホのGPS情報が空港の位置情報に到着したら音声で通知するフローを作成します。

<img width="900" border="1" src="images/gemini6.png">

## 1. フローを作成
mqtt inノードの後ろにgeo fenceノード、templateノード、play audioノードを接続します。

<img width="900" border="1" src="images/airport_voice_flow.png">

## 2. geo fenceノードに対象とする場所を指定
geo fenceノードは、指定した範囲に入ったかどうかを判定するノードです。geo fenceノードのプロパティを開き、円のアイコンをクリックして中部国際空港を以下のように囲みます。

<img width="900" border="1" src="images/geo_fence_airport.png">

## 3. templateノードに読み上げ文を入力
templateノードは、定型文のメッセージを記入するノードです。templateノードのプロパティには読み上げたい文章として「空港に到着しました」と記載します。

<img width="900" border="1" src="images/template_airport.png">

## 4. フローのデプロイと動作確認
デプロイボタンを押してフローを有効にします。
今回は、講師が用意したフローで中部国際空港の位置情報を手動で送信します。上手くゆけばスマホが中部国際空港の位置情報に到着したことになり、「空港に到着しました」という音声が再生されます。

# 飛行機の位置情報を地図上に可視化するフロー
次には、飛行機の位置情報を地図上に可視化するフローを作成します。

<img width="900" border="1" src="images/gemini7.png">

## 1. フローを作成
これまで作成したフローの下に新しいフローを作成します。まずopensky-networkノードとworldmapノードをワークスペースにドラッグアンドドロップして、ワイヤーで接続します。

<img width="900" border="1" src="images/airplane_map_flow.png">

## 2. 取得する飛行機の緯度経度の範囲を指定
opensky-networkノードは、OpenSky Networkが提供する飛行機の位置情報を取得するノードです。opensky-networkノードのプロパティを開き、以下のように設定します。

- 緯度(南端):
  ```
  32
  ```
- 経度(西端):
  ```
  136
  ```
- 緯度(北端):
  ```
  37
  ```
- 経度(東端):
  ```
  140
  ```

<img width="900" border="1" src="images/opensky_properties.png">

この緯度経度の範囲設定によって、東海地方の飛行機の位置情報を取得できるようになります。

## 2. フローのデプロイと地図表示
デプロイボタンを押してフローを有効にします。デプロイボタンの左側にある「Open world map」ボタンをクリックして、地図を表示してみましょう。

<img width="900" border="1" src="images/airplane_world_map.png">

すると現在の飛行機の位置情報がリアルタイムに地図上に表示されます。

# 飛行機が近づいてきたら通知するフロー
次に飛行機が近づいてきたら通知するフローを作成します。ここでは、江南市役所を基準点として、飛行機が近づいてきたら方角と距離を音声で通知するフローを作成します。

<img width="900" border="1" src="images/gemini8.png">

## 1. フローを作成
まず、geo fenceノード、functionノード、play audioノードをワークスペースにドラッグアンドドロップして、ワイヤーで接続します。

<img width="900" border="1" src="images/airplane_notification_flow.png">

## 2. 対象とする位置の範囲を指定
geo fenceノードのプロパティを開き、円のアイコンをクリックして江南市役所から県営名古屋空港の手前あたりを以下のように囲みます。

<img width="900" border="1" src="images/geo_fence_konan.png">

県営名古屋空港を含めない理由は、着陸中の飛行機に対して通知を行わないためです。

## 3. ChatGPTを用いて飛行機がある方角と距離を算出するコードを作成
functionノードは、独自のJavaScriptコードを実行するノードです。プログラムのコードを自分で書くのは大変です。そこでやりたいことを言葉(プロンプト)でChatGPTに伝えてコードを作成してもらいましょう。まず以下のURLをクリックしてChatGPTのページを開きます。

https://chatgpt.com/

次に以下のプロンプトをコピーして、ChatGPTの入力欄に貼り付けて実行します。

```
Node-REDのfunctionノードに書くソースコードを作成してください。入力として緯度msg.payload.latと経度msg.payload.lonが与えられます。この緯度と経度を使い、江南市役所を基準点とした方角と距離を算出してください。ルールは次のとおりです。
- 方角は北、北東、東、南東、南、南西、西、北西の8方向で表現する
- 距離の計算にはHaversine式を用いる
- 距離は小数は使わず、四捨五入して整数にする
- 出力msg.payloadには「方角は○、距離は○kmです」（例：方角は北東、距離は15kmです）と入れる
- 変数の名前は半角英文字にする
```

<img width="900" border="1" src="images/chatgpt_prompt.png">

上手くいけば以下のようなソースコードが生成されます。コードの右上に表示される「このコードをコピーする」ボタンをクリックして、コードをコピーします。

<img width="900" border="1" src="images/chatgpt_code.png">

上手くいかない場合は、[本ページ](https://chatgpt.com/share/6975b166-f50c-8001-8dc6-b98f1ea8a12a)にアクセスして、ソースコードをコピーしてください。

次に、Node-REDフローエディタに戻り、functionノードのプロパティを開きます。コード入力欄に先ほどコピーしたソースコードを貼り付けて、「完了」ボタンをクリックします。

<img width="900" border="1" src="images/function_node_code.png">

## 4. フローをデプロイして動作確認
デプロイボタンを押してフローを有効にします。飛行機が江南市役所の近くに来ると、「方角は○、距離は○kmです」という音声が再生されます。

なかなか近くに飛行機が来ない場合は、geo fenceノードの範囲を広げてみてください。

# まとめ
このハンズオンでは、Node-REDを使用して、センサデータや位置情報を可視化する方法を学びました。Node-REDは、簡単に作りたいものを実現できる強力なツールです。ぜひ、今後も活用してみてください。

<img width="900" border="1" src="images/gemini_summary.png">

[^1]: GitHubは、ソフトウェア開発プロジェクトのソースコードを管理・共有するためのプラットフォームです。Gitというバージョン管理システムを基盤としており、複数の開発者が同時にコードを編集・更新できるようにします。GitHubは、リポジトリ（プロジェクトのコードやドキュメントを格納する場所）を作成し、コードの変更履歴を追跡し、バグ修正や新機能の追加などのコラボレーションを容易にします。また、GitHubはオープンソースプロジェクトのホスティングにも広く利用されており、世界中の開発者が共同でソフトウェアを開発するための重要なプラットフォームとなっています。

<!--
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
-->
