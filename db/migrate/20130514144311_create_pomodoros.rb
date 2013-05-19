class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer :duration, :null => false
      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
