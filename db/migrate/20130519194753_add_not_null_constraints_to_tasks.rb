class AddNotNullConstraintsToTasks < ActiveRecord::Migration
  def up
    change_column :tasks, :name, :string, :null => false
    change_column :tasks, :start, :datetime, :null => false
  end

  def down
    change_column :tasks, :name, :string, :null => true
    change_column :tasks, :start, :datetime, :null => true
  end
end
