Feature: 職制として直近１週間分の点検結果を取得して個々の点検結果の詳細を一点検ずつ確認した後、再度直近１週間分の点検結果一覧が見たい

  # ＜点検結果一覧画面＞
  # 画面全体
  # ・画面の表示領域はPCのサイズ（1024*768）
  # ・縦スクロールあり
  # 画面構成
  # ・周期
  #   ・半角1文字
  # ・部位
  #   ・最長で30文字
  #   ・漢字、ひらがな以外(英数字、カタカナ)は半角
  #   ・必要に応じて折り返して表示する
  # ・項目
  #   ・最長で全角40文字
  #   ・必要に応じて折り返して表示する
  # ・点検結果
  #   ・点検順でソート
  #   ・当日を含む直近7日分
  #   ・1日の表示は3シフト分
  #   ・日付は指定した時間帯(9:00-33:00を同日とする)で算出する
  #     ・1シフト:9:00-17:00
  #     ・2シフト:17:00-25:00
  #     ・3シフト:25:00-33:00

  # ＜異常対応確認入力画面＞
  # 画面全体
  # ・画面の表示領域はPCのサイズ（1024*768）
  # 画面構成
  # ・「対応完了」ボタン:
  #   ・画面右下へ配置する
  # ・「一覧に戻る」ボタン:
  #   ・画面右上へ配置する
  # ・部位:
  #   ・画面上部分中央へ表示する
  #   ・上限30文字
  #   ・漢字、ひらがな以外(英数字、カタカナ)は半角
  # ・項目:
  #   ・上限40文字
  #   ・1行で表示する
  # ・方法:
  #   ・上限80文字
  #   ・2行で表示する
  # ・基準:
  #   ・上限80文字
  #   ・2行で表示する
  #   ・下限値または上限値がある場合は文末に単位を付けて表示する
  # ・点検結果:
  #   ・読み取り専用
  #   ・正常／異常選択式は、正常または異常を表示
  #   ・数値入力式は、数値(整数部4桁、小数部4桁、マイナス値は数値の前に"-")と単位を表示
  # ・点検者氏名コード
  #   ・英数字7文字
  #   ・読み取り専用
  # ・点検日時
  #   ・表示フォーマットは YYYY/MM/DD HH:MM:SS
  #   ・読み取り専用
  # ・異常内容:
  #   ・読み取り専用
  #   ・上限140文字
  # ・対応・処置:
  #   ・ラジオボタンで「交換」、「調整」、「清掃」を選択する
  #   ・選択解除ができる
  # ・対応内容
  #   ・上限140文字
  #   ・1行で表示する
  # ・対応者氏名コード:
  #   ・テキストフィールドに入力する
  #   ・点検時に対応・処置を入力していれば、点検者氏名コードを表示する
  #   ・英数字7文字
  # ・対応日時:
  #   ・テキストフィールドに入力する
  #   ・点検時に対応・処置を入力していれば点検時の日時を表示する
  #        (表示フォーマットは YYYY/MM/DD HH:MM:SS)
  #   ・(参考)日時として扱えない入力値の場合はエラーを表示する

  Background:

    Given 現在の日時が、"2010/12/15 10:00:00"である
    And 以下の周期を登録している:
      |周期 |間隔 |単位  |
      |S    |8    |時間  |
      |D    |24   |時間  |
      |W    |168  |時間  |
      |M    |1    |ヶ月  |
    And 以下の工程と設備を登録している:
      |工程名 |設備名 |
      |工程A  |C01    |
      |工程B  |D01    |
      |工程B  |D02    |
    And 以下の点検内容・点検結果を登録している:
      |工程名 |設備名 |周期 |部位名 |部位順 |項目  |項目順 |方法  |基準  |上限値 |下限値 |単位 |点検方式 |選択結果 |入力結果 |異常内容 |点検予定日時        |点検者氏名コード |点検終了日時        |点検順 |点検ID |対応者氏名コード |対応・処置 |対応内容            |対応日時            |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/08 09:00:00 |staff01          |2010/12/08 13:30:00 |0      |1      |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/09 09:00:00 |staff03          |2010/12/09 09:30:00 |0      |3      |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |×       |         |異常A    |2010/12/10 09:00:00 |staff06          |2010/12/10 10:45:00 |0      |6      |staff51          |交換       |部品Aを交換しました |2010/12/10 15:00:00 |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/11 09:00:00 |staff09          |2010/12/11 13:30:00 |0      |9      |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/12 09:00:00 |staff12          |2010/12/12 15:30:00 |0      |12     |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |×       |         |異常B    |2010/12/13 09:00:00 |staff15          |2010/12/13 11:20:00 |0      |15     |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/14 09:00:00 |staff18          |2010/12/14 10:30:00 |0      |18     |                 |           |                    |                    |
      |工程A  |C01    |D    |部位S  |0      |項目A |0      |方法A |基準A |       |       |     |選択     |○       |         |         |2010/12/15 09:00:00 |staff21          |2010/12/15 09:30:00 |0      |21     |                 |           |                    |                    |
      |工程A  |C01    |W    |部位S  |0      |項目B |1      |方法B |基準B |100.0  |50.0   |ml/m |入力     |         |125.0    |異常C    |2010/12/12 09:00:00 |staff12          |2010/12/12 15:30:00 |1      |12     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/09 01:00:00 |staff02          |2010/12/09 03:30:00 |0      |2      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/09 09:00:00 |staff03          |2010/12/09 09:30:00 |1      |3      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/09 17:00:00 |staff04          |2010/12/09 20:30:00 |0      |4      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/10 01:00:00 |staff05          |2010/12/10 01:30:00 |0      |5      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |×       |         |異常D    |2010/12/10 09:00:00 |staff06          |2010/12/10 10:45:00 |1      |6      |staff06          |調整       |                    |2010/12/10 10:45:00 |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/10 17:00:00 |staff07          |2010/12/10 22:15:00 |0      |7      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/11 01:00:00 |staff08          |2010/12/11 04:45:00 |0      |8      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/11 09:00:00 |staff09          |2010/12/11 13:30:00 |1      |9      |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/11 17:00:00 |staff10          |2010/12/11 21:30:00 |0      |10     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/12 01:00:00 |staff11          |2010/12/12 05:30:00 |0      |11     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/12 09:00:00 |staff12          |2010/12/12 15:30:00 |2      |12     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |×       |         |異常E    |2010/12/12 17:00:00 |staff13          |2010/12/13 00:10:00 |0      |13     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/13 01:00:00 |staff14          |2010/12/13 03:30:00 |0      |14     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/13 09:00:00 |staff15          |2010/12/13 11:20:00 |1      |15     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/13 17:00:00 |staff16          |2010/12/13 18:40:00 |0      |16     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/14 01:00:00 |staff17          |2010/12/14 06:30:00 |0      |17     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/14 09:00:00 |staff18          |2010/12/14 10:30:00 |1      |18     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/14 17:00:00 |staff19          |2010/12/14 23:30:00 |0      |19     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/15 01:00:00 |staff20          |2010/12/15 03:30:00 |0      |20     |                 |           |                    |                    |
      |工程A  |C01    |S    |部位S  |0      |項目C |2      |方法C |基準C |       |       |     |選択     |○       |         |         |2010/12/15 09:00:00 |staff21          |2010/12/15 09:30:00 |1      |21     |                 |           |                    |                    |
      |工程A  |C01    |M    |部位T  |1      |項目D |0      |方法D |基準D |70.0   |50.0   |dB   |入力     |         |60.0     |         |2010/12/10 17:00:00 |staff07          |2010/12/10 22:15:00 |1      |7      |                 |           |                    |                    |
      |工程A  |C01    |M    |部位U  |2      |項目D |0      |方法E |基準E |       |       |     |選択     |         |         |         |                    |                 |                    |       |       |                 |           |                    |                    |
      |工程B  |D01    |     |       |       |      |       |      |      |       |       |     |         |         |         |         |                    |                 |                    |       |       |                 |           |                    |                    |
      |工程B  |D02    |     |部位V  |0      |      |       |      |      |       |       |     |         |         |         |         |                    |                 |                    |       |       |                 |           |                    |                    |

      # 結果 ○=正常, ×=異常, (無し)=点検結果が無い

  #01
  Scenario: 設備を選択すると直近7日分の点検結果が表示されて、メニューボタンを押下するとメニュー画面が表示される

    Given "日常点検確認メニュー"画面が表示されている
    And 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

    When "工程A"リンクをクリックする

    Then 工程名の下に以下の"設備名"が表示されていること:
      |C01 |

    When "C01"リンクをクリックする

    Then 設備"C01"の"点検結果一覧"画面を表示すること
    And "メニューへ"と表示されていること
    And 点検結果一覧画面に以下のヘッダ情報が表示されていること:
      |周期 |部位  |項目  |12/09      |12/10      |12/11      |12/12      |12/13      |12/14      |12/15      |
    And 点検結果一覧画面に以下の点検結果一覧が表示されていること:
      |D    |部位S |項目A |○ |   |   |× |   |   |○ |   |   |○ |   |   |× |   |   |○ |   |   |○ |   |   |
      |W    |部位S |項目B |   |   |   |   |   |   |   |   |   |× |   |   |   |   |   |   |   |   |   |   |   |
      |S    |部位S |項目C |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |○ |○ |   |   |
      |M    |部位T |項目D |   |   |   |   |○ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      |M    |部位U |項目D |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |

    When "メニューへ"ボタンをクリックする

    Then "日常点検確認メニュー"画面を表示すること
    And 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |
    And 工程名の下に以下の"設備名"が表示されていること:
      |C01 |

  #02
  Scenario: 設備に対して点検項目がなければ点検結果一覧画面が表示されない

    Given "日常点検確認メニュー"画面が表示されている
    And 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

    When "工程B"リンクをクリックする

    Then 工程名の下に以下の"設備名"が表示されていること:
      |D01 |D02 |

    When "D01"リンクをクリックする

    Then "日常点検確認メニュー"画面を表示すること
    And 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |
    And 工程名の下に以下の"設備名"が表示されていること:
      |D01 |D02 |
    And "点検項目がありません"とアラートメッセージが表示されること

  #03
  Scenario: 直近一週間分の点検結果「×」をクリックするとそれぞれの点検内容の結果が表示される

    Given "日常点検確認メニュー"画面が表示されている
    And 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

    When "工程A"リンクをクリックする

    Then 工程名の下に以下の"設備名"が表示されていること:
      |C01 |

    When "C01"リンクをクリックする

    Then 設備"C01"の"点検結果一覧"画面を表示すること
    And "メニューへ"と表示されていること
    And 点検結果一覧画面に以下のヘッダ情報が表示されていること:
      |周期 |部位  |項目  |12/09      |12/10      |12/11      |12/12      |12/13      |12/14      |12/15      |
    And 点検結果一覧画面に以下の点検結果一覧が表示されていること:
      |D    |部位S |項目A |○ |   |   |× |   |   |○ |   |   |○ |   |   |× |   |   |○ |   |   |○ |   |   |
      |W    |部位S |項目B |   |   |   |   |   |   |   |   |   |× |   |   |   |   |   |   |   |   |   |   |   |
      |S    |部位S |項目C |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |○ |○ |   |   |
      |M    |部位T |項目D |   |   |   |   |○ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      |M    |部位U |項目D |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |

    When "1"行目の点検、"2"日目の"1"シフト目の点検結果リンクをクリックする

    # 周期"D",部位"部位S",項目"項目A"の12/10第1シフトの点検結果

    Then 点検ID"6"、点検順"0"の"異常対応確認入力"画面を表示すること
    And "一覧に戻る"と表示されていること
    And "対応完了"と表示されていること
    And 異常対応確認入力画面に以下のヘッダ情報が表示されていること:
      |部位S |
    And 異常対応確認入力画面に以下の内容が表示されること:
      |項目名           |項目値              |タイプ |備考               |
      |項目             |項目A               |       |                   |
      |方法             |方法A               |       |                   |
      |基準             |基準A               |       |                   |
      |点検結果         |異常                |       |                   |
      |点検者氏名コード |staff06             |       |                   |
      |点検日時         |2010/12/10 10:45:00 |       |                   |
      |異常内容         |異常A               |text   |abnormal_content   |
      |対応・処置       |交換                |radio  |corrective_action  |
      |対応内容         |部品Aを交換しました |text   |corrective_content |
      |対応者氏名コード |staff51             |text   |staff_code         |
      |対応日時         |2010/12/10 15:00:00 |text   |corrected_datetime |

    When "一覧に戻る"ボタンをクリックする

    Then 設備"C01"の"点検結果一覧"画面を表示すること
    And 点検結果一覧画面に以下のヘッダ情報が表示されていること:
      |周期 |部位  |項目  |12/09      |12/10      |12/11      |12/12      |12/13      |12/14      |12/15      |
    And 点検結果一覧画面に以下の点検結果一覧が表示されていること:
      |D    |部位S |項目A |○ |   |   |× |   |   |○ |   |   |○ |   |   |× |   |   |○ |   |   |○ |   |   |
      |W    |部位S |項目B |   |   |   |   |   |   |   |   |   |× |   |   |   |   |   |   |   |   |   |   |   |
      |S    |部位S |項目C |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |× |○ |○ |○ |○ |○ |○ |○ |○ |   |   |
      |M    |部位T |項目D |   |   |   |   |○ |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      |M    |部位U |項目D |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |

    When "2"行目の点検、"4"日目の"1"シフト目の点検結果リンクをクリックする

    # 周期"W",部位"部位S",項目"項目B"の12/12第1シフトの点検結果

    Then 点検ID"12"、点検順"1"の"異常対応確認入力"画面を表示すること
    And "一覧に戻る"と表示されていること
    And "対応完了"と表示されていること
    And 異常対応確認入力画面に以下のヘッダ情報が表示されていること:
      |部位S |
    And 異常対応確認入力画面に以下の内容が表示されること:
      |項目名            |項目値                   |タイプ |備考               |
      |項目              |項目B                    |       |                   |
      |方法              |方法B                    |       |                   |
      |基準              |基準B 50.0 ～ 100.0 ml/m |       |                   |
      |点検結果          |125.0000 ml/m            |       |                   |
      |点検者氏名コード  |staff12                  |       |                   |
      |点検日時          |2010/12/12 15:30:00      |       |                   |
      |異常内容          |異常C                    |text   |abnormal_content   |
      |対応・処置        |(未選択)                 |radio  |corrective_action  |
      |対応内容          |(空欄)                   |text   |corrective_content |
      |対応者氏名コード  |(空欄)                   |text   |staff_code         |
      |対応日時          |(空欄)                   |text   |corrected_datetime |
