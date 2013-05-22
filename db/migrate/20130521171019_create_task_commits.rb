class CreateTaskCommits < ActiveRecord::Migration
  def change
    create_table :task_commits do |t|
      t.integer :task_id
      t.foreign_key :tasks

      t.integer :commit_id
      t.foreign_key :commits

      t.timestamps
    end
  end
end
