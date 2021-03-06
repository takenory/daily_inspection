# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :check_has_result_in_controller, :class => Check do |f|
    f.entry_type 0
    f.result {Result.new}
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_does_not_have_result_in_controller, :class => Check do |f|
    f.entry_type 0
    f.scheduled_datetime {DateTime.now}
  end

  factory :check_of_sequentially_in_controller, :class => Check do |f|
    f.entry_type 0
    f.sequence(:sequence) {|n|n}
    f.scheduled_datetime {DateTime.now}
  end

  factory :result_of_request_parameter, :class => Result do |f|
    f.measured_value 9999.9999
    f.judgment true
    f.abnormal_content "異常内容"
    f.corrective_action 0
  end

  factory :result_of_invalid_request_paramter, :parent => :result_of_request_parameter do |f|
    f.measured_value nil
    f.judgment nil
  end

  factory :result_init_instance, :class => Result do |f|
    f.judgment true
  end
end
