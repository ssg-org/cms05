class Media < ActiveRecord::Migration
  def up
  	create_table :media do |t|
  
  		t.string	:title,     :null => false
		t.string    :slug, 		:null => false
  		t.timestamps
  	end
    add_index :media, :slug
  end

  def down
  	drop_table	:media
  end
end
