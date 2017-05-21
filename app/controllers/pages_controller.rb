class PagesController < ApplicationController
  def index
  end

  def show
    if params[:id].to_i == 0 
      @page = Page.find_by!(url: params[:id])
    else
      @page = Page.find_by!(id: params[:id])
    end
  end
end
