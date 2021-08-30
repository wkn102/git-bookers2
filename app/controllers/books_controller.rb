class BooksController < ApplicationController
  
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book.id), notice: 'successfully'
   else
     @books = Book.all
     render :index
   end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  if @book.user == current_user
    render "edit"
  else
    redirect_to books_path
  end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'successfully'
    else
      render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end


end
