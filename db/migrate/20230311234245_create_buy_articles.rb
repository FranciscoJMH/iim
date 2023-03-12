class CreateBuyArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_articles do |t|
      t.belongs_to :buy, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
