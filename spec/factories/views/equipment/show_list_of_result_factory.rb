# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :cycle_for_equipment_show_list_of_result, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 4
  end

  factory :equipment_for_equipment_show_list_of_result, :class => Equipment do |f|
  end

  factory :part_for_equipment_show_list_of_result, :class => Part do |f|
    f.name "部位A"
  end

  factory :check_parent_for_equipment_show_list_of_result, :class => Check do |f|
    f.item "項目A"
    f.scheduled_datetime DateTime.now
  end

  factory :check_child_for_equipment_show_list_of_result, :class => Check do |f|
    f.item "check_child"
    f.entry_type 0
    f.scheduled_datetime DateTime.now
  end

  factory :result_for_equipment_show_list_of_result_true, :class => Result do |f|
    f.judgment true
  end

  factory :result_for_equipment_show_list_of_result_false, :class => Result do |f|
    f.judgment false
    f.abnormal_content "異常です。"
    f.corrective_action 0
  end
end