class Machinery < ApplicationRecord
  belongs_to :provider
  belongs_to :enterprise

  attr_accessor :days_difference
  validates :number, presence: true, uniqueness: true
end
