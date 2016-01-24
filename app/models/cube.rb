class Cube < ActiveRecord::Base
	has_many :user_cube_mappings
	has_many :users, through: :user_cube_mappings
	has_many :cube_content_mappings
	has_many :contents, through: :cube_content_mappings
end
