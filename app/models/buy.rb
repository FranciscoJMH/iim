class Buy < ApplicationRecord
  belongs_to :project

  has_many :buy_articles
  has_many :articles, through: :buy_articles
end
