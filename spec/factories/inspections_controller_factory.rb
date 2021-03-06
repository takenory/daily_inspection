# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :inspection_has_check, :class => Inspection do
  end

  factory :check_belong_to_inspection, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :inspection_for_update_action, :class => Inspection do
  end

  factory :check_is_normal, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :cycle_has_normal_unit_type, :class => Cycle do |f|
    f.title "s"
    f.unit_type 0
    f.interval 4
  end

  factory :check_has_valid_result, :class => Check do |f|
    f.cycle {FactoryGirl.create(:cycle_has_normal_unit_type)}
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :station_for_inspection_update_action, :class => Station do |f|
  end
end