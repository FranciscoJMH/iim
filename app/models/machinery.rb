class Machinery < ApplicationRecord
  belongs_to :provider
  belongs_to :enterprise

  attr_accessor :days_difference, :selected_enterprise_name
  validates :number, presence: true, uniqueness: { message: "ya está en uso por otra maquinaria" }
end
