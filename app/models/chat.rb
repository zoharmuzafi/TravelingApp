class Chat < ActiveRecord::Base
	has_many :userchats, dependent: :destroy
  	has_many :users, through: :userchats
	has_many :messages, dependent: :destroy
end

