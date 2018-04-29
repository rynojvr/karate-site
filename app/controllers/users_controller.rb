class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_nav_category

  def show
  end

  def edit
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_nav_category
      @nav_category = 'user_settings'
    end

end
