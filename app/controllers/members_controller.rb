class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = Post.order(id: :desc).not_hidden.first(5)
  end
end
