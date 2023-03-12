class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :unit
      t.float :price
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
