class CreateUserContentMappings < ActiveRecord::Migration
  def change
    create_table :user_content_mappings do |t|
      t.integer :user_id
      t.integer :content_id

      t.timestamps null: false
    end
  end
end
