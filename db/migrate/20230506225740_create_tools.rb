class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.text :description
      t.string :brand
      t.float :caliber
      t.text :characteristics
      t.date :buying_date
      t.date :ingress_date
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
