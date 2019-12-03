class CommentsController < ApplicationController
    before_action :find_book
    def new 
        @comment = Comment.new
    end 

    def create 
        @comment = Comment.new(comment_params)
        @comment.park_id = @park.id
        @user.user_id = current_user.id

        if @comment.save
            redirect_to @park
        else
            render :new
    end 

private 
def comment_params
    params.require(:comment).permit(:comment)
end

def find_park
    @park = Park.find(params[park.id])
end

end 

