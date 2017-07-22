class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = Post.order(id: :desc).first(5)
  end
end
