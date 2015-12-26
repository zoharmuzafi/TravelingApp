class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :destination, presence: true, length: { minimum: 2 }
	validates :description, presence: true, length: { minimum: 10 }
end
