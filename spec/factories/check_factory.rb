# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :check_has_part, :class => Check do |f|
    f.part {Part.create}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_has_result, :class => Check do |f|
    f.entry_type 0
    f.result {Result.new}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_part, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_result, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_of_sequentially, :class => Check do |f|
    f.entry_type 0
    f.sequence(:sequence) {|n|n}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_specified_limit, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_has_result_for_save, :class => Check do |f|
    f.entry_type 0
    f.result {Result.new}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_result_for_save, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_has_cycle, :class => Check do |f|
    f.cycle {Cycle.create}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_cycle, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_scheduled_by_cycle, :class => Check do |f|
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.cycle_id nil
  end

  factory :cycle_only_title, :class => Cycle do |f|
    f.title "cycle_title"
  end

  factory :check_scheduled_by_hour, :class => Check do |f|
  end

  factory :check_scheduled_by_month, :class => Check do |f|
  end

  factory :cycle_of_master, :class => Cycle do |f|
    f.title "S"
  end

  factory :check_of_master, :class => Check do |f|
    f.inspection_id nil
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.parent_id nil
    f.cycle_title nil
  end

  factory :check_of_operation, :class => Check do |f|
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.cycle_id nil
  end

  factory :check_has_inspection, :class => Check do |f|
    f.inspection {Inspection.create}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_inspection, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_of_master_for_getting_latest_result, :class => Check do |f|
    f.inspection_id nil
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.parent_id nil
    f.cycle_title nil
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_of_operation_for_getting_latest_result, :class => Check do |f|
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.cycle_id nil
  end

  factory :inspection_for_getting_latest_result, :class => Inspection do
  end

  factory :result_for_getting_latest_result, :class => Result do
  end

  factory :cycle_for_making_check_child, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 8
  end

  factory :part_for_making_check_child, :class => Part do |f|
    f.name "部位A"
  end

  factory :inspection_for_making_check_child, :class => Inspection do |f|
    f.staff_code nil
  end

  factory :check_for_making_check_child, :class => Check do |f|
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

  factory :cycle_for_result_list_within_the_period, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 8
  end

  factory :part_for_result_list_within_the_period, :class => Part do |f|
    f.name "部位A"
  end

  factory :check_for_result_list_within_the_period, :class => Check do |f|
    f.inspection_id nil
    f.part {FactoryGirl.create(:part_for_result_list_within_the_period, :sequence => 0)}
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.parent_id nil
    f.cycle {FactoryGirl.create(:cycle_for_result_list_within_the_period)}
    f.cycle_title nil
    f.scheduled_datetime {DateTime.now}
    f.part_name nil
  end

  factory :inspection_for_result_list_within_the_period, :class => Inspection do |f|
    f.staff_code "staff01"
  end

  factory :result_for_rusult_list_within_the_period, :class => Result do |f|
    f.judgment true
    f.measured_value nil
    f.abnormal_content nil
    f.corrective_action nil
  end

  factory :inspection_for_find_with_inspection_and_result_and_part, :class => Inspection do
  end
  factory :equipment_for_find_with_inspection_and_result_and_part, :class => Equipment do |f|
    f.name "設備A"
  end
  factory :part_for_find_with_inspection_and_result_and_part, :class => Part do |f|
    f.equipment_id {FactoryGirl.create(:equipment_for_find_with_inspection_and_result_and_part).id}
    f.name "部位A"
  end
  factory :cycle_for_find_with_inspection_and_result_and_part, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 8
  end
  factory :check_master_for_find_with_inspection_and_result_and_part, :class => Check do |f|
    f.inspection_id nil
    f.part {FactoryGirl.create(:part_for_find_with_inspection_and_result_and_part)}
    f.cycle {FactoryGirl.create(:cycle_for_find_with_inspection_and_result_and_part)}
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.parent_id nil
    f.cycle_title nil
    f.scheduled_datetime {DateTime.now}
    f.part_name nil
  end
end