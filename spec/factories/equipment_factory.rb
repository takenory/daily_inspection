# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :equipment_has_parts, :class => Equipment do |f|
    f.station_id nil
    f.name "equipment_has_part"
  end

  factory :part_belongs_to_equipment, :class => Part do |f|
    f.name "part_belongs_to_equipment"
  end

  factory :equipment_has_checks_throw_part, :class => Equipment do |f|
    f.name "equipment_has_checks_throw_part"
  end

  factory :part_at_each_equipment, :class => Part do |f|
    f.name "part_at_each_equipment"
  end

  factory :check_at_each_equipment_scheduled_at, :class => Check do |f|
    f.item "check_at_each_equipment_scheduled_at"
    f.scheduled_datetime DateTime.now
  end

  factory :cycle_of_shift_for_start_inspection, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 8
  end

  factory :equipment_for_start_inspection, :class => Equipment do |f|
    f.name "ABC01"
  end

  factory :part_for_start_inspection, :class => Part do
  end

  factory :check_of_master_for_start_inspection, :class => Check do |f|
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

  factory :equipment_for_list_of_results, :class => Equipment do |f|
  end

  factory :part_for_list_of_results, :class => Part do |f|
  end

  factory :cycle_of_shift_for_list_of_results, :class => Cycle do |f|
    f.title "S"
  end

  factory :result_for_list_of_results, :class => Result do |f|
    f.judgment true
  end

  factory :check_of_parent_for_list_of_results, :class => Check do |f|
    f.cycle {FactoryGirl.create(:cycle_of_shift_for_list_of_results)}
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_for_list_of_results, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :inspection_for_list_of_results, :class => Inspection do |f|
    f.staff_code "staff01"
  end

  factory :equipment_for_check_of_parents_included_part_and_cycle, :class => Equipment do |f|
  end
  factory :part_for_check_of_parents_included_part_and_cycle, :class => Part do |f|
  end
  factory :cycle_for_check_of_parents_included_part_and_cycle, :class => Cycle do |f|
  end
  factory :check_for_check_of_parents_included_part_and_cycle, :class => Check do |f|
    f.cycle {FactoryGirl.create(:cycle_for_check_of_parents_included_part_and_cycle)}
    f.scheduled_datetime {DateTime.now}
  end
  factory :inspection_for_check_of_parents_included_part_and_cycle, :class => Inspection do |f|
    f.staff_code "staff01"
  end
  factory :result_for_check_of_parents_included_part_and_cycle, :class => Result do |f|
    f.judgment true
    f.abnormal_content "異常内容を入力しました。"
  end
end