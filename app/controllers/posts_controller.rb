class PostsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(flag: post_params[:flag], name_item: post_params[:item_name], text: post_params[:text], user_id: current_user.id)
    if @post.save
       redirect_to root_path, notice:"投稿「#{post.item_name}を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:flag, :item_name, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
