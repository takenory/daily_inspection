# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DailyInspectionCloud::Application.initialize!

# 点検期間拡張ライブラリ
require 'ext_inspection_period'