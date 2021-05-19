# frozen_string_literal: true

class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :scores
end
