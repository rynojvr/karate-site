class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:home]

  def home
  end

  # def login
  #   render layout: 'blank_layout'
  # end
  #
  # def login_form
  #   redirect_to members_url
  # end

  protected

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path #, :notice => 'If you wanna add a notice'
      end
    end

end
