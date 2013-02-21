class Posts < ActiveRecord::Migration
  def up
  	create_table :posts do |t|
  		# t.references	:user, :null => false
  		t.string			:title,      :null => false
  		t.text				:content,     :null => false

      t.string      :slug, :null => false

  		t.timestamps
  	end
    add_index :posts, :slug
  end

  def down
  	drop_table	:posts
  end
end
