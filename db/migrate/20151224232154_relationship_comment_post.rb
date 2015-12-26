class RelationshipCommentPost < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
    	t.belongs_to :post
  	end
  	add_column :comments, :line, :string
  end
end
