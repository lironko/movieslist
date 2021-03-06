class Blogpost < ActiveRecord::Base
	has_many :blogcomments, dependent: :destroy
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :title,   presence: true
end
