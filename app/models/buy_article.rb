class BuyArticle < ApplicationRecord
  belongs_to :buy
  belongs_to :article
end
