class CommentsController < ApplicationController
    before_action :find_park
    #before_action :find_park, only: [:edit, :update, :destroy]
    def new 
        @comment = Comment.new
        @park = Park.find(params[:park_id])
    end 

    def create 
        @comment = Comment.new(comment_params)
        #associate a comment with the current park
        @comment.park_id = @park.id
        @comment.user_id = session[:user_id]

        if @comment.valid?
            @comment.save
            redirect_to @park
        else
            render :new
        end 
    end

    def edit
        #byebug
    end

    def update
        if @comment.update(comment_params)
            redirect_to @park
        else 
            render :edit
        end
    end 

    def destroy
        @comment.destroy
        redirect_to @park
    end 

private 
    def comment_params
        params.require(:comment).permit(:text)
    end

def find_park
    @park = Park.find(params[:park_id])
end

#finding the current park that the comment is associated with (park_id in database)
    def find_comment
        @comment = Comment.find(params[:id])
    end 

end 
