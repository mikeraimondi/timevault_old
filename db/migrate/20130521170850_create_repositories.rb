class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name, :null => false
      t.string :url, :null => false
      t.integer :user_id
      t.foreign_key :users

      t.timestamps
    end
  end
end
