class BuyArticle < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :buy
  belongs_to :article
end
