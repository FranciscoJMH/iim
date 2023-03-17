class Provider < ApplicationRecord
  has_many :articles, dependent: :delete_all
end
