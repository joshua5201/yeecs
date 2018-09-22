class AlumniController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user

    if @user.update_without_password(user_params)
      flash[:notice] = "資料更新成功"
      redirect_to alumni_path
    else
      flash[:alert] = "資料更新失敗 #{@user.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :grade, :student_no, :company_name, :mobile, :telephone, :zipcode, :address, :job, :company_phone, :master, :master_instructor, :phd, :phd_instructor, :current_location, :note, :company_email)
  end
end
