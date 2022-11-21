class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        spices=Spice.all
        render json:spices, status: :ok
    end


    def create
        spice=Spice.create(
            spice_params
        )
        render json: spice, status: :created
    end

    def update
        spice=find_by
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice=find_by
        spice.destroy
        head :no_content
    end


    private
    def find_by
        Spice.find_by(id:params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found
        render json: {error: "Spice not found"}, status: :not_found
    end
end
