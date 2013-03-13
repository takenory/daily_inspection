# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :station_saved_in_session, :class => Station do
  end
  factory :equipment_requested_from_web_api, :class => Equipment do
  end
  factory :part_in_equipment_requested_from_web_api, :class => Part do
  end
  factory :check_scheduled_at_1_hour_before, :class => Check do |f|
    f.scheduled_datetime {DateTime.now - Rational(1, 24)}
  end

  factory :cycle_of_shift_for_start_inspection_in_controllers, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 8
  end

  factory :equipment_for_start_inspection_in_controllers, :class => Equipment do |f|
    f.name "ABC01"
  end

  factory :part_for_start_inspection_in_controllers, :class => Part do
  end

  factory :check_of_master_for_start_inspection_in_controllers, :class => Check do |f|
    f.inspection_id nil
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 1
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.parent_id nil
    f.cycle_title nil
    f.part_name nil
  end
end