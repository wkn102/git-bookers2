class PostImagesController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @post_image = PostImage.new
  end

  #投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_image_path
  end

  def index

  end

  def show
  end

  def destroy
  end

   # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image)
  end

end
