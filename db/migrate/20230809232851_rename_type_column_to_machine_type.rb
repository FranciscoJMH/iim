class RenameTypeColumnToMachineType < ActiveRecord::Migration[7.0]
  def change
    rename_column :machineries, :type, :machine_type
  end
end

