class AddPomodorosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pomodoro_id, :integer
  end
end
