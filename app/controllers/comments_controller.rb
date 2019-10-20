class CommentsController < ApplicationController
    before_action :find_post, only: [:create,:edit,:update,:destroy]
    before_action :find_comment, only: [:edit,:update,:destroy]

    def create
        @comment = @post.comments.new(comment_params)

        if @comment.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @comment.update_attributes(comment_params)
            flash[:notice] = "comment updatet succesfully"
        else
            flash[:notice] = "comment was not updated"
        end 
        redirect_to @post  
    end

    def destroy
        @comment.destroy
        redirect_to @post 
    end 

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_comment
        @comment = @post.comments.find(params[:id])
    end 

    def comment_params
        params.require(:comment).permit(:content)
    end 

     
end
