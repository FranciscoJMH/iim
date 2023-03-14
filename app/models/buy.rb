class Buy < ApplicationRecord
  validate :iva
  belongs_to :project
  belongs_to :user

  has_many :buy_articles, dependent: :delete_all
  has_many :articles, through: :buy_articles

  def calculate_total
    total = 0
    buy_articles.each do |buy_article|
      total += buy_article.quantity * buy_article.article.price
    end
    return total
  end

end
