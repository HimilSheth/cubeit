class CreateCubeContentMappings < ActiveRecord::Migration
  def change
    create_table :cube_content_mappings do |t|
      t.integer :cube_id
      t.integer :content_id

      t.timestamps null: false
    end
  end
end
