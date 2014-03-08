class BlogcommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def index
	end

	def create
		@blogpost = Blogpost.find(params[:blogcomment][:blogpost_id])
		@blogcomment = @blogpost.blogcomments.build(blogcomment_params)
		@blogcomment.user_id = current_user.id
		if @blogcomment.save
			flash[:success] = "Comment created!"
			redirect_to @blogpost
		else
			render @blogpost
		end
	end

	def destroy
	end

	private

	def blogcomment_params
		params.require(:blogcomment).permit(:content, :blogpost_id)
	end
end