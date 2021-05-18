# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    player
    score_point { 10 }
    score_at { '2021-05-18 17:40:00' }
  end
end
