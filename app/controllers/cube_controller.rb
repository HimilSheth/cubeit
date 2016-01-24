class CubeController < ApplicationController
    def create_cube
        param! :name, String, required: true
        cube = Cube.create(name: params[:name])
        user = User.find(params[:user_id])
        user.cubes << cube
        if cube.nil?
          render json: { message: 'Cube not created' }, status: :bad_request
        else
          render json: cube, root: false
        end
    end

    def delete_cube
        cube = Cube.find(params[:cube_id])
        user = User.find(params[:user_id])
        user.cubes.delete(cube)
        cube.contents.delete_all
        render :nothing => true, :status => :ok
    end

    def share_cube
        user = User.find(params[:user_id])
        cube = Cube.find(params[:cube_id])
        user.cubes << cube
        render json: { cube_id: params[:cube_id], user_id: params[:user_id] }, status: :ok
    end

    def list_cube
        user = User.find(params[:user_id])
        render json: user.cubes, status: :ok
    end
end
