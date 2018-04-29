class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :set_nav_category
  before_action :check_rack_mini_profiler

  private

    def set_nav_category
      @nav_category = 'default_category'
    end

    def check_rack_mini_profiler
      if params[:rmp] && Rails.env.staging?
        Rack::MiniProfiler.authorize_request
      end
    end

end
