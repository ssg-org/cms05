class Pages < ActiveRecord::Migration
  def up
  	create_table	:pages do |t|
      t.references  :user, :null => false

  		t.text	:title,		:null => false
  		t.text	:content, :null => false

  		t.text	:slug


      t.text  :ancestry

  		t.timestamps
  	end

  	add_index	:pages, :slug, :unique => true
    add_index :pages, :ancestry
  end

  def down
  	drop_table	:pages
  end
end
