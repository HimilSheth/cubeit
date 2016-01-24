class ContentSerializer < ActiveModel::Serializer
	attributes :id, :link, :user_id

	def user_id
		object.users.first.id
	end

end
