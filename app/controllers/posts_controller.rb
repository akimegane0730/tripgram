class PostsController < ApplicationController
  # サインイン済みユーザーのみにアクセス許可をするdeviseが持ってるヘルパーメソッド
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:user).order('created_at DESC').limit(10)
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def show
    @post = Post.find(params[:id])
    @photos = Photo.where(photo_id: @post.id)
    @user = User.find(user_id: @post_id)
  end

  private
    def post_params
      params.require(:post).permit(:content, photos_attributes: [:image]).merge(user_id: current_user.id)
    end
end
