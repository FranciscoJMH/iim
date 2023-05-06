class CreateMachineries < ActiveRecord::Migration[7.0]
  def change
    create_table :machineries do |t|
      t.integer :number
      t.string :code
      t.string :type
      t.text :characteristics
      t.float :cost_iva
      t.float :freight
      t.date :init_date
      t.date :renovation_date
      t.text :note
      t.references :provider, null: false, foreign_key: true
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
