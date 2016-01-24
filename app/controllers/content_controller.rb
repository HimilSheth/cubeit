class ContentController < ApplicationController
  def create_content
    param! :link, String, required: true
    content = Content.create(link: params[:link])
    user = User.find(params[:user_id])
    user.contents << content
    if content.nil?
      render json: { message: 'Content not created' }, status: :bad_request
    else
      render json: content, root: false
    end
  end

  def add_content_to_cube
    cube = Cube.find(params[:cube_id])
    content = Content.find(params[:content_id])
    cube.contents << content
    render json: { cube_id: params[:cube_id], content_id: params[:content_id] }
  end

  def delete_content_from_cube
    cube = Cube.find(params[:cube_id])
    content = Content.find(params[:content_id])
    cube.contents.delete(content)
    render nothing: true, status: 200
  end

  def share_content
    user = User.find(params[:user_id])
    content = Content.find(params[:content_id])
    user.contents << content
    render json: { user_id: params[:user_id], content_id: params[:content_id] }
  end

  def list_content
  	user = User.find(params[:user_id])
  	user_contents = (user.contents + user.cubes.contents).pluck(:id).uniq
  	render json: Content.where(:id => user_contents), status: :ok
  end
end
