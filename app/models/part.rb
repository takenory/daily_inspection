# -*- coding: utf-8 -*-
# Partsテーブルのモデル。
class Part < ActiveRecord::Base
  has_many :checks

  attr_accessible :equipment_id, :name, :sequence

  # 指定された日時に実施する点検一覧を返却する。
  # === 引き数
  # datetime 日時
  # === 戻り値
  # 点検一覧（Checkオブジェクトの配列）
  def scheduled_checks_at(datetime)
    self.checks
        .includes(:cycle)
        .where('parent_id is null and scheduled_datetime <= ?', datetime)
        .order('sequence asc')
        .all
  end
end
