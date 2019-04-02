class PostsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    if params[:search]
      @posts = Post.where('item_name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(6)
    else
      @posts = Post.sorted.page(params[:page]).per(6)
    end
  end

  def myindex
    if params[:search]
      @posts = Post.where('item_name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(6)
    else
      @posts = Post.where(user_id: current_user.id).page(params[:page]).sorted.per(6)
    end
    @gets_item = Post.where(flag: 0).where(user_id: current_user.id).count
    @releases_item = Post.where(flag: 1).where(user_id: current_user.id).count
    @notice_message = notice_message(@gets_item, @releases_item)
  end

  def search
  @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(flag: post_params[:flag], item_name: post_params[:item_name], text: post_params[:text], image: post_params[:image], user_id: current_user.id)
    if @post.save
       redirect_to root_path, notice:"投稿「#{@post.item_name}を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "「#{@post.item_name}を削除しました。"
    redirect_to myindex_path
  end


  private
  def post_params
    params.require(:post).permit(:flag, :item_name, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def notice_message(posts_flag_zero, posts_flag_one)
    if posts_flag_one == 0 || posts_flag_zero == 0
        "どんどん登録していこう"
    elsif  posts_flag_one / posts_flag_zero >= 2
         "断捨離が捗ってますね"
    else
       "一つ手にしたら二つ手放すことを意識しましょう"
    end
  end

end
