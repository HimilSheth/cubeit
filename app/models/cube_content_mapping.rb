class CubeContentMapping < ActiveRecord::Base
	belongs_to :cube
	belongs_to :content
end
