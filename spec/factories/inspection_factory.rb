# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :inspection_valid_result_data, :class => Inspection do
  end

  factory :check_has_valid_result_judgment_false, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_has_invalid_result, :class => Check do |f|
    f.inspection_id {Inspection.create.id}
    f.entry_type 1
    f.lower_limit 10.0
    f.upper_limit 20.0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_has_not_been_checked, :class => Check do |f|
    f.inspection_id {Inspection.create.id}
    f.scheduled_datetime {DateTime.now}
  end

  factory :inspection_has_checks, :class => Inspection do |f|
    f.checks {[FactoryGirl.create(:check_belongs_to_inspection_1st), FactoryGirl.create(:check_belongs_to_inspection_2nd)]}
  end

  factory :check_belongs_to_inspection_1st, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_belongs_to_inspection_2nd, :class => Check do |f|
    f.scheduled_datetime {DateTime.now}
  end

  factory :inspection_does_not_have_check, :class => Inspection do |f|
  end

  factory :cycle_is_normal, :class => Cycle do |f|
    f.title "s"
    f.unit_type 0
    f.interval 4
  end

  factory :check_has_normal_cycle, :class => Check do |f|
    f.cycle {FactoryGirl.create(:cycle_is_normal)}
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :inspection_has_normal_checks, :class => Inspection do |f|
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :check_is_normal1, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :check_is_normal2, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :cycle_is_abnormal, :class => Cycle do |f|
    f.title "s"
    f.interval 4
  end

  factory :check_has_abnormal_cycle, :class => Check do |f|
    f.cycle {FactoryGirl.create(:cycle_is_abnormal)}
    f.item "項目A"
    f.operation "方法B"
    f.criterion "基準C"
    f.entry_type 0
    f.unit_name "km/h"
    f.upper_limit 40
    f.lower_limit 60
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :inspection_has_abnormal_checks, :class => Inspection do |f|
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :check_is_abnormal1, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end

  factory :check_is_abnormal2, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
    f.updated_at {DateTime.now - Rational(10,24)}
  end
end