class Completed < ActiveRecord::Migration[5.2]
  def up
   change_column :todos, :completed, :boolean, :default =>  false
  end

  def down 
    remove_column :todos, :completed
  end
end
