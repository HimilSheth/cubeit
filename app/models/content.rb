class Content < ActiveRecord::Base
	has_many :cube_content_mappings
	has_many :cubes, through: :cube_content_mappings
	has_many :user_content_mappings
	has_many :users, through: :user_content_mappings
end
