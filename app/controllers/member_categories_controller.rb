class MemberCategoriesController < ApplicationController
  def show
    @member_category = get_resource_by_url_or_id(MemberCategory)
  end
end
