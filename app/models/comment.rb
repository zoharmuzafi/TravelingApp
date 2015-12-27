class Comment < ActiveRecord::Base
	belongs_to :post
	validates :line, presence: true, length: { minimum: 8 }
end
