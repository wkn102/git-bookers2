class PostImage < ApplicationRecord
   belongs_to :user
   attachment :image # ここを追加（_idは含めません）

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def destroy
  end

 private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
