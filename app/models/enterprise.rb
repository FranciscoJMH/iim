class Enterprise < ApplicationRecord
  belongs_to :responsible
  has_many :machineries
  has_many :tools
end
