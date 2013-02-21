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
}, :without_protection => true)

lorem = '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'

home_page = Page.create({ :user => user,  :title => 'Who we are', :content => "#{lorem}#{lorem}"}, :without_protection => true)
about_page = Page.create({ :user => user,  :title => 'About', :content => lorem}, :without_protection => true)

projects_page = Page.create({ :user => user,  :title => 'Projects', :content => '<ul><li>ssg</li><li>ssg.org</li></ul>', :parent => home_page}, :without_protection => true)
organization_page = Page.create({ :user => user,  :title => 'Organization', :content => '<ul><li><a href="john-doe">john doe</a></li><li><a href="john-doe">niko nikogovic</a></li><li>ibro mulalic</li></ul>', :parent => home_page}, :without_protection => true)

john_doe_page = Page.create({ :user => user,  :title => 'John Doe', :content => 'Ime: john doe', :parent => organization_page}, :without_protection => true)
niko_page = Page.create({ :user => user,  :title => 'Niko Nikogovic', :content => 'Ime: niko nikogovic', :parent => organization_page}, :without_protection => true)
im_page = Page.create({ :user => user,  :title => 'Ibro Mulalic', :content => 'Ime: ibro mulalic', :parent => organization_page}, :without_protection => true)


post1 = Post.create({ :user => user,  :title => 'First post', :content => lorem}, :without_protection => true)
post2 = Post.create({ :user => user,  :title => 'Second post', :content => lorem}, :without_protection => true)
post3 = Post.create({ :user => user,  :title => '3rd post', :content => lorem}, :without_protection => true)
post3 = Post.create({ :user => user,  :title => '4th post', :content => lorem}, :without_protection => true)
post3 = Post.create({ :user => user,  :title => 'Fifth post', :content => lorem}, :without_protection => true)
