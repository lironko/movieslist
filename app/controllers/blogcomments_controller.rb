class BlogcommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :current_or_admin,   only: [:destroy]


	def create
		@blogpost = Blogpost.find(params[:blogcomment][:blogpost_id])
		@blogcomment = @blogpost.blogcomments.build(blogcomment_params)
		@blogcomment.user_id = current_user.id
		if @blogcomment.save
			flash[:success] = "Comment created!"
			redirect_to @blogpost
		else
			flash[:error] = "Could not post comment."
			redirect_to @blogpost
		end
	end

	def destroy
		@blogpost = Blogcomment.find(params[:id]).blogpost
		Blogcomment.find(params[:id]).destroy
		flash[:success] = "Comment deleted."
		redirect_to @blogpost
	end

	private

	def blogcomment_params
		params.require(:blogcomment).permit(:content, :blogpost_id)
	end

	def current_or_admin
		@blogcomment = Blogcomment.find(params[:id])		
		@user = @blogcomment.user
		redirect_to root_url unless current_user?(@user) || admin_user?
	end

end