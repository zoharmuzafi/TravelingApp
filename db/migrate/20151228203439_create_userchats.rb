class CreateUserchats < ActiveRecord::Migration
  def change
    create_table :userchats do |t|
      	t.timestamps

	    # define foreign keys for associated models
	    t.belongs_to :user
	    t.belongs_to :chat

    end
  end
end
