class Buy < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :buy_articles, dependent: :delete_all
  has_many :articles, through: :buy_articles
end
