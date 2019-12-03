class CommentsController < ApplicationController
    before_action :find_book
    before_action :find_comment, only: [:edit, :update, :destroy]
    def new 
        @comment = Comment.new
    end 

    def create 
        @comment = Comment.new(comment_params)
        #associate a comment with the current park
        @comment.park_id = @park.id
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to park_path(@park)
        else
            render :new
    end 

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to park_path(@park)
        else 
            render :edit
        end
    end 

    def destroy
        @comment.destroy
        redirect_to park_path(@park)
    end 

private 
def comment_params
    params.require(:comment).permit(:comment)
end

def find_park
    @park = Park.find(params[park.id])
end

#finding the current park that the comment is associated with (book_id)
def find_comment
    @comment = Comment.find(params[:id])
end 

end 
