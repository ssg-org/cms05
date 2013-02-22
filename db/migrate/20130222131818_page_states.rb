class PageStates < ActiveRecord::Migration

  def up

  	create_table :states do |t|
  		t.string	:name
  		t.string	:description
  		t.timestamps
  	end
  	change_table	:pages do |t|
  		t.references :state,	:null => false, :default => 1
  	end
  	change_table	:posts do |t|
  		t.references :state, :null => false, :default => 1
  	end

  end

  def down
  	drop_table	:states
  	remove_column :posts, :state_id
  	remove_column	:pages, :state_id
  end
end
