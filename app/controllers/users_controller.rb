class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :edit, :destroy, :following, :followers, :update]

  def show
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def update
    current_user.update_attributes!(user_params)
    current_user.industry_ids = params[:user][:industry_ids] ||= []
    current_user.hobby_ids = params[:user][:hobby_ids] ||= []
    current_user.sport_ids = params[:user][:sport_ids] ||= []
    current_user.nationality_ids = params[:user][:nationality_ids] ||= []

    redirect_to root_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:wharton_email, :cluster_number, :class_year, :frequency, :first_dinner, :industry_ids,
      :hobby_ids, :nationality_ids, :sport_ids, :suggestions)
    end
    
end
