# -*- coding: utf-8 -*-
# Stationsテーブルのモデル。
class Station < ActiveRecord::Base
  has_many :equipment
  attr_accessible :name
end
