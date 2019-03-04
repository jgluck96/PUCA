class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :tech_stack
      t.boolean :completed

      t.timestamps
    end
  end
end
