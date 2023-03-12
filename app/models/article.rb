class Article < ApplicationRecord
  belongs_to :provider

  has_many :buy_articles
  has_many :buys, through: :buy_articles
end
