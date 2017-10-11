class MemberCategoriesController < ApplicationController
  def index
    @member_categories = MemberCategory.all
  end
  def show
    @member_category = get_resource_by_url_or_id(MemberCategory)
  end
end
