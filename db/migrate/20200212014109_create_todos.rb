class CreateTodos < ActiveRecord::Migration[5.2]
  def up
    create_table :todos do |t|
      t.string :description
      t.boolean :completed
       

      t.timestamps
    end
  end

  def down 
    drop_table :todos 
  end
end
