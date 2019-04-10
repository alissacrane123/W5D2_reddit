class PostsController < ApplicationController
    before_action :require_login!, except: [:show]
    before_action :require_author!, only: [:edit, :update]

    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        # @post.author_id = current_user.id 
        # @post.sub_id = params[:sub_id]
        @post = current_user.posts.new(post_params)

        # instead of above : @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        # @post = Post.find(params[:id])
        @post = current_user.posts.find(params[:id])

        # if @post.update(post_params)
        if @post.update_attributes(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit 
        end
    end

    private

    def post_params
        # params.require(:post).permit(:url, :title, :content, :user_id, sub_ids: [])
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

    def require_author!
        return if current_user.posts.find_by(id: params[:id])
        render json: 'Forbidden', status: :forbidden
    end
end
