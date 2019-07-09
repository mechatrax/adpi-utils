adpi-utils
==========

ADPi を操作するためのツール類を提供します。

## 提供ファイル
次のファイルがパッケージに含まれています。

### /usr/sbin/adpictl  
  ADPi を操作するための実行ファイルです。  
  コマンドラインの構文を次に示します。

  adpictl [OPTION] COMMAND ...

  COMMAND に指定可能な引数の書式を次に示します。

  + get PARAMETER  
    指定した PARAMETER の値を取得します。  
    PARAMETER には次のいずれかを指定します。  

    - freqency  
      設定されているサンプリング周波数を表示します。  
      単位は Hz です。  

    - gain  
      設定されている電圧レンジに対応したゲイン倍率を表示します。  

    - output \<CH\>  
      接続先 CH の電源端子の出力状態を表示します。  

    - scale  
      設定されている電圧レンジに対応した分解能を表示します。  
      単位は mV です。  

    - temperature  
      ADC 内部の温度を表示します。  
      単位は ℃ です。  

    - voltage \<CH\>  
      接続先 CH の測定した電圧を表示します。  
      単位は mV です。  

  + set PARAMETER ...  
    指定した PARAMETER に値を設定します。  
    PARAMETER には次のいずれかを指定します。  

    - freqency \<VALUE\>  
      サンプリング周波数を設定します。  
      単位は Hz です。  

    - gain \<VALUE\>  
      電圧レンジを設定します。  
      ゲイン倍率を指定します。  

    - output \<CH\> {on|off}  
      接続先 CH の電源端子の出力状態を設定します。  

    - scale \<VALUE\>  
      電圧レンジを設定します。  
      分解能を指定します。  
      単位は mV です。  

  + help  
    ヘルプを表示します。

  + version  
    バージョンを表示します。  

  OPTION に指定可能な引数の書式を次に示します。  
  指定しない場合はデフォルトが使用されます。  

  + -c, --config \<FILE\>  
    FILE から設定を読み込みます。  
    デフォルトは /etc/adpi.conf です。  

  + -s, --spi <DEVICE_NUMBER>  
    DEVICE_NUMBER で指定したデバイスを使用します。  
    DEVICE_NUMBER には接続された SPI バスの CS の番号を指定します。  
    デフォルトは 0 です。  

  + -i, --iio <DEVICE_NUMBER>  
    DEVICE_NUMBER で指定されたデバイスを使用します。  
    DEVICE_NUMBER には認識された iio:device の番号を指定します。  
    デフォルトは 0 です。  

### /etc/adpi.conf  
  ADPi の設定を記述するファイルです。

  記述可能なセクションを次に示します。

  + [spi0.0]  
    SPI0 の CS0 に接続されたデバイスの設定を記述します。  

  + [spi0.1]  
    SPI0 の CS1 に接続されたデバイスの設定を記述します。  

  各セクションで設定可能な項目を次に示します。  

  + device  
    使用するデバイスの種類を指定します。  
    次の値が指定できます。  
    - adpipro  
      ADPi Pro を使用する場合に指定します。
    - &nbsp;  
      使用するデバイスが存在しない場合は空文字列を指定します。

  + eeprom  
    校正データを格納する EEPROM のアドレスを指定します。  
    アドレスは 16 進数で指定します。  

  + gpio  
    電源端子の出力に使用する GPIO エキスパンダのアドレスを指定します。  
    アドレスは 16 進数で指定します。  

### /usr/lib/adpi-utils/parse_parameters.sh  
  設定ファイルのパラメータを取得して表示するスクリプトファイルです。

### /usr/lib/adpi-utils/parse_sections.sh  
  設定ファイルのセクションを取得して表示するスクリプトファイルです。

### /usr/share/bash-completion/completions/adpictl
  adpictl のコマンド補完を行うための設定ファイルです。

### /usr/share/doc/adpi-utils/changelog.gz
  パッケージの変更履歴を記録したファイルです。

### /usr/share/doc/adpi-utils/copyright
  著作権とライセンスを記載したファイルです。
