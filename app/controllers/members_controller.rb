class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = Post.order(id: :desc).where(hidden: false).first(5)
  end
end
