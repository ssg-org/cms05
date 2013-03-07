class PageStates < ActiveRecord::Migration

  def up
    create_table  :categories do |t|
      t.string  :name
      t.timestamps
    end

    create_table :category_memberships do |t|
      t.references  :category
      t.references  :post
    end
  	
    create_table :states do |t|
  		t.string	:name
  		t.string	:description
  		t.timestamps
  	end

  	change_table	:pages do |t|
  		t.references :state,	:null => false, :default => 1
      t.string     :template
  	end
  	
    change_table	:posts do |t|
  		t.references :state, :null => false, :default => 1
      t.string     :format
      t.text       :meta
  	end
  end

  def down
    drop_table  :categories
    drop_table  :states
  	remove_column :posts, :state_id
  	remove_column	:pages, :state_id
  end
end
