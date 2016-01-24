class UserCubeMapping < ActiveRecord::Base
	belongs_to :user
	belongs_to :cube
end
