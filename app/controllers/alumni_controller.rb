class AlumniController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user

    if @user.update_without_password(user_params)
      flash[:notice] = "success"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :grade, :student_no, :company_name)
  end
end
