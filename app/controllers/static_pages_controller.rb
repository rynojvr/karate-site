class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
  end

  def login
    render layout: 'blank_layout'
  end

  def login_form
    redirect_to members_url
  end
end
