class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    def show
        @dog = Dog.find(params[:id])
    end
    def new 
        @dog = Dog.new
    end
    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save
            redirect_to @dog
        else 
            redirect_to :new
        end
    end


    private
    def dog_params
        params.require(:dog).permit(:name, :user_id, :avatar, :bio)
    end
end
