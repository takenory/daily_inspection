# -*- coding: utf-8 -*-
# Cyclesテーブルのモデル。
class Cycle < ActiveRecord::Base
  attr_accessible :title, :interval, :unit_type

  # 間隔の単位を表す定数（"時間" = 0, "ヶ月" = 1）
  UNIT_TYPES = {"HOURS" => 0, "MONTHS" => 1}

end
