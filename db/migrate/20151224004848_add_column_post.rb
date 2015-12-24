class AddColumnPost < ActiveRecord::Migration
  def change
  	add_column :posts, :destination, :string
  	add_column :posts, :description, :string
  end
end
