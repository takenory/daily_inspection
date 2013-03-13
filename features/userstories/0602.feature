Feature: 職制として工程と設備で絞り込まれた1週間分の結果が見たい

  # ＜日常点検確認メニュー画面＞
  # 画面全体
  # ・画面の表示領域はPCのサイズ（1024*768）
  # ・工程と設備の表示領域は3:7とする
  # ・縦スクロールあり
  # 画面左部分
  # ・工程名
  # 　・最長で全角10文字
  # 　・折り返しなし
  # 画面右部分
  # ・工程名
  # 　・最長で全角10文字
  # 　・折り返しなし
  # ・設備名
  # 　・最長で半角英数5文字
  # 　・折り返しなし
  # 　・横4列で表示
  Background:
    Given 以下の工程と設備を登録している:
      |工程名 |設備名 |
      |工程A  |ABC01  |
      |工程A  |ABC02  |
      |工程A  |ABC03  |
      |工程A  |ABC04  |
      |工程A  |ABC05  |
      |工程A  |ABC06  |
      |工程A  |ABC07  |
      |工程A  |ABC08  |
      |工程A  |ABC09  |
      |工程A  |ABC10  |
      |工程B  |       |

  #01
  Scenario: 日常点検確認メニュー画面を表示したときに画面左部分に登録されている工程を全て表示できる
    When "日常点検確認メニュー"画面を表示する

    Then 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

  #02
  Scenario: 画面左部分の工程を選択したとき、工程に属する設備が存在する場合は画面右部分に工程名とその工程に属する設備名を表示できる
    When "日常点検確認メニュー"画面を表示する
    Then 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

    When "工程A"リンクをクリックする

    Then 画面の右上に以下の工程名が表示されていること
      |工程A |

    And 工程名の下に以下の"設備名"が表示されていること:
      |ABC01 |ABC02 |ABC03 |ABC04 |
      |ABC05 |ABC06 |ABC07 |ABC08 |
      |ABC09 |ABC10 |      |      |

  #03
  Scenario: 画面左部分の工程を選択したとき、工程に属する設備が存在しない場合は画面右部分に工程名と登録されている設備がない旨のメッセージを表示できる
    When "日常点検確認メニュー"画面を表示する
    Then 以下の"工程"が一覧で表示されていること:
      |工程A |
      |工程B |

    When "工程B"リンクをクリックする

    Then 画面の右上に以下の工程名が表示されていること
      |工程B |

    And  "登録されている設備はありません"と表示されていること