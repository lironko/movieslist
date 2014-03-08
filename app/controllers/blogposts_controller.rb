class BlogpostsController < ApplicationController
  include SessionsHelper
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@blogposts = Blogpost.paginate(page: params[:page], per_page: 5)
  end

  def show
  	@blogpost = Blogpost.find(params[:id])
    @blogcomment = @blogpost.blogcomments.build 
    @blogcomments = @blogpost.blogcomments.paginate(page: params[:page])
  end

  def new
  	@blogpost = Blogpost.new
  end

  def create
  	@blogpost = current_user.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "Blog post created!"
      redirect_to blog_url
    else
      render 'new'
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Blog post updated!"
      redirect_to blogpost_url
    else
      render 'edit'
    end
  end

  def destroy
    Blogpost.find(params[:id]).destroy
    flash[:success] = "Blog post deleted successfully."
    redirect_to blog_url
  end

  private
  def blogpost_params
  	params.require(:blogpost).permit(:title, :content)  	
  end
end
