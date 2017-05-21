class MemberCategoriesController < ApplicationController
  def show
    if params[:id].to_i == 0 
      @member_category = MemberCategory.find_by!(url: params[:id])
    else
      @member_category = MemberCategory.find_by!(id: params[:id])
    end
  end
end
