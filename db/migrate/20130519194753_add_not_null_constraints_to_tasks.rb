class AddNotNullConstraintsToTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :name, :string, :null => false
    change_column :tasks, :start, :datetime, :null => false
  end
end
