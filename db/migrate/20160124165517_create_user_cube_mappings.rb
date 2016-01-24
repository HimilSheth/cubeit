class CreateUserCubeMappings < ActiveRecord::Migration
  def change
    create_table :user_cube_mappings do |t|
      t.integer :user_id
      t.integer :cube_id

      t.timestamps null: false
    end
  end
end
