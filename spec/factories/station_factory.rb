# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :equipment_belongs_to_station, :class => Equipment do |f|
  end

  factory :station_does_not_have_equipment, :class => Station do |f|
  end

  factory :station_has_equipment, :class => Station do |f|
    equipment {FactoryGirl.create_list(:equipment_belongs_to_station, 2)}
  end
end