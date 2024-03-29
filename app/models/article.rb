class Article < ApplicationRecord
  belongs_to :provider

  has_many :buy_articles, dependent: :delete_all
  has_many :buys, through: :buy_articles
end

def provider_name
  @provider.each do |provider|
    name = :provider.name
  end
  return name
end


