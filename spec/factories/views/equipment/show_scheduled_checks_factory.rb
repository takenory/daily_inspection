# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :cycle_for_equipment_show_scheduled_checks, :class => Cycle do |f|
    f.title "S"
    f.unit_type 0
    f.interval 4
  end

  factory :equipment_for_equipment_show_scheduled_checks, :class => Equipment do |f|
  end

  factory :part_for_equipment_show_scheduled_checks, :class => Part do |f|
    f.name "pppart"
  end

  factory :check_for_equipment_show_scheduled_checks, :class => Check do |f|
    f.item "cccheck"
    f.scheduled_datetime DateTime.now
  end

  factory :result_for_equipment_show_scheduled_checks, :class => Result do |f|
   f.judgment true
  end
end