class CubeController < ApplicationController
    def create_cube
        param! :name, String, required: true
        cube = Cube.create(name: params[:name])
        user = User.find(params[:user_id])
        user.cubes << cube
        render json: cube, root: false
    end

    def delete_cube
        cube = Cube.find(params[:cube_id])
        cube.users.delete_all
        cube.contents.delete_all
        render json: {}, :status => :ok
    end

    def share_cube
        user = User.find(params[:user_id])
        cube = Cube.find(params[:cube_id])
        user.cubes << cube
        render json: { cube_id: params[:cube_id], user_id: params[:user_id] }, status: :ok
    end

    def list_cube
        user = User.find(params[:user_id])
        render json: user.cubes, root: false, status: :ok
    end
end
