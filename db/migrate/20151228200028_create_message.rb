class CreateMessage < ActiveRecord::Migration
  def change
    change_table :messages do |t|
    	t.belongs_to :chat
  	end
  	add_column :messages, :content, :string
    end
  end
