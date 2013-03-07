# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({
	:email => 'cms@cms.com', 
	:encrypted_password => Digest::SHA256.hexdigest('cms'),
	:firstname => 'Administrator',
	:lastname => '',
	:role => User::ADMIN_ROLE
})


category_sidebar = Category.create({ :name => 'Sidebar' })


publish_state = State.create(	{ :name => 'Published', :description => 'Published page/post'})
draft_state = State.create(	{ :name => 'Draft', :description => 'Saved as draft'})

page_home = Page.create({ :state => publish_state, :user => user,  :title => 'Home', :content => "Home of something"})
page_about = Page.create({ :state => publish_state, :user => user,  :title => 'About', :content => "About"})
page_posts = Page.create({ :state => publish_state, :user => user,  :title => 'Posts', :content => "Posts"})
page_sample     = Page.create({ :state => publish_state, :user => user,  :title => 'Sample Page', :content => ""})
page_parent     = Page.create({ :state => publish_state, :user => user,  :title => 'Parent Page', :content => ""})
page_sub1     = Page.create({ :state => publish_state, :user => user,  :title => 'Sub Page 1', :content => "", :parent => page_parent})
page_sub2     = Page.create({ :state => publish_state, :user => user,  :title => 'Sub Page 2', :content => "", :parent => page_parent})



post1 = Post.create({ :categories => [  ], :state => publish_state, :user => user,  :title => 'First post',  :content => 'lorem'})
post2 = Post.create({ :categories => [  ], :state => publish_state, :user => user,  :title => 'Second post', :content => 'lorem'})

sidepost_1 = Post.create({ :categories => [ category_sidebar ], :state => publish_state, :user => user,  :title => 'Sidebar post 1', :content => 'lorem'})
sidepost_2 = Post.create({ :categories => [ category_sidebar ], :state => publish_state, :user => user,  :title => 'Sidebar post 2', :content => 'lorem'})
