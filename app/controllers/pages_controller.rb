class PagesController < ApplicationController
  def index
    @post_categories = PostCategory.includes(:posts).order(id: :asc).first(3)
  end

  def show
    if params[:id].to_i == 0 
      @page = Page.find_by!(url: params[:id])
    else
      @page = Page.find_by!(id: params[:id])
    end
  end
end
