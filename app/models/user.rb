class User < ActiveRecord::Base
	has_many :user_cube_mappings
	has_many :cubes, through: :user_cube_mappings
	has_many :user_content_mappings
	has_many :contents, through: :user_content_mappings
end
