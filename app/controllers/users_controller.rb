class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
   if @user.save
    redirect_to user_path(@user.id), notice: 'successfully'
   else
     render :index
   end
  end

  def show
    @user = User.find(params[:id]) #１,どのユーザーか特定
    @book = Book.new
    @books = @user.books #2,特定したユーザーの本の情報
  end

 def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
 end

 def index
   @users = User.all
   @user = current_user
   @book = Book.new
 end

 def update
    @user = User.find(params[:id])
    @users =User.all
  if @user.update(user_params)
    redirect_to user_path(@user), notice: 'successfully'
  else
    render:edit
  end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  

end

