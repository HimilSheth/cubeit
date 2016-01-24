class CubeSerializer < ActiveModel::Serializer
	attributes :id, :name, :user_id

	def user_id
		object.users.first.id
	end
end
