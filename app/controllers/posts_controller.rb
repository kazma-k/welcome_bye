class PostsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.find(params[:id])
  end

  def create
    Post.create(item_name: post_params[:item_name], text: post_params[:text], user_id: current_user.id)

  end

  def edit
  end

  private
  def post_params
    params.permit(:item_name, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
