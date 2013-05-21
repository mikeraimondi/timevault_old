class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha1
      t.integer :repository_id
      t.foreign_key :repositories

      t.timestamps
    end
  end
end
