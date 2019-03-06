class ChangeDefaultValueOfProjectCompletedColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :completed, :boolean, :default => false
  end
end
