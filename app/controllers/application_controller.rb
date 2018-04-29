class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :set_nav_category

  private

    def set_nav_category
      @nav_category = 'default_category'
    end
    
end
