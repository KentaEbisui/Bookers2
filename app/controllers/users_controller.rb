class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
   @book = Book.new
   @books = Book.all.order(created_at: :desc)
   @user = current_user
   @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'update successfully.'
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
