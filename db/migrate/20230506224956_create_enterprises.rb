class CreateEnterprises < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.references :responsible, null: false, foreign_key: true

      t.timestamps
    end
  end
end
