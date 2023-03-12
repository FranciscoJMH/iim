class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.float :quantity
      t.float :iva
      t.float :total
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
