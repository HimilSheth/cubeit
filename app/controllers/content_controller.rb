class ContentController < ApplicationController
  def create_content
    param! :link, String, required: true
    content = Content.create(link: params[:link])
    user = User.find(params[:user_id])
    user.contents << content
    if content.nil?
      render json: { message: 'Content not created' }, status: :bad_request
    else
      render json: content, root: false, status: :ok
    end
  end

  def add_content_to_cube
    cube = Cube.find(params[:cube_id])
    content = Content.find(params[:content_id])
    cube.contents << content
    render json: { cube_id: params[:cube_id], content_id: params[:content_id] }, status: :ok
  end

  def delete_content_from_cube
    cube = Cube.find(params[:cube_id])
    content = Content.find(params[:content_id])
    cube.contents.delete(content)
    render json: {}, status: :ok
  end

  def share_content
    user = User.find(params[:user_id])
    content = Content.find(params[:content_id])
    user.contents << content
    render json: { user_id: params[:user_id], content_id: params[:content_id] }, status: :ok
  end

  def list_content
  	user = User.find(params[:user_id])
  	id = []
  	id += user.contents.pluck(:id)
  	user.cubes.each do |cube|
  		id += cube.contents.pluck(:id)
  	end
  	unique_ids = id.uniq
  	render json: Content.where(:id => unique_ids), root: false, status: :ok
  end
end
