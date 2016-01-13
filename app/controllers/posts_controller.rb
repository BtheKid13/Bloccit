class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show

    @post = Post.find(params[:id])
  end

  def new
    # This is linkign to the Post model and creating a new instance of Post.
    # Then I assigned it to an instance V. so we can use it anywhere!
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to @post
    else

      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end
end
