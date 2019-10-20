class PostsController < ApplicationController
    before_action :find_post, only: [:show,:edit,:update,:destroy]
    before_action :check_user, only: [:update,:edit]

    def index
        @posts = Post.all.includes(:comments)
    end

    def new
        @post = current_user.posts.new
        #@post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)

        if @post.save
            redirect_to @post 
        else
            render 'new'
        end
    end 

    def show 
        
    end 

    def edit

    end 

    def update

        if @post.update_attributes(post_params)
            redirect_to @post
        else 
            render 'edit'
        end 
    end

    def destroy 
        @post.destroy
        redirect_to root_path
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end 

    def post_params
        params.require(:post).permit(:title,:content)
    end 

    def check_user 
        if(current_user != @post.user)
            flash[:notice] = "You can not modify posts of another authors"
            redirect_to @post
        end
    end
end
