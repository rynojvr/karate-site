class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ActionView::Helpers::UrlHelper

  protect_from_forgery with: :exception

  before_action :complete_registration

  before_action :set_nav_category
  before_action :check_rack_mini_profiler

  private

    def complete_registration
      if current_user and
          not (current_page?(root_path) or
            current_page?(destroy_user_session_path) or
            request.path == user_path(current_user)) and
          not current_user.finished_registration?

        redirect_to root_path

      end
    end

    def set_nav_category
      @nav_category = 'default_category'
    end

    def check_rack_mini_profiler
      if current_user && Rails.env.staging?
        Rack::MiniProfiler.authorize_request
      end
    end

end
