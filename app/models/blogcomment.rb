class Blogcomment < ActiveRecord::Base
	belongs_to :user
	belongs_to :blogpost
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :blogpost_id, presence: true
	validates :content, presence: true, length: { maximum: 500 }
end
