class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'active_admin_pages_base.rb'

  before_filter :load_categories

  protected

  def load_categories
    @categories = Category.all
  end
end
