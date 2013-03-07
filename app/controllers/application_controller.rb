require 'cms/pager'
require 'themes/context'

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter	:refresh_pager

  def refresh_pager
  	@pager = CMS::Pager.new
  end


 	def render_404
    render :file => "#{Rails.root}/app/views/themes/#{theme}/404.html", :layout => false
  end  

  def theme
    return ApplicationController.theme
  end

  def self.theme
    return Themes::Context.get_theme()
  end

  def self.theme=(value)
    Themes::Context.set_theme(value)
  end
end
