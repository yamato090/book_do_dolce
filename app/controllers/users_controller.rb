class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
      @user = current_user
      @users = User.all.page(params[:page]).per(10)
      @recipe = Recipe.new
      @recipes = Recipe.all
  end

  def show
      @user = User.find(params[:id])
      @recipe = Recipe.new
      @recipes = @user.recipes
      favorites = Favorite.where(user_id: current_user.id).pluck(:recipe_id)  # ログイン中のユーザーのお気に入りのrecipe_idカラムを取得
      @favorite_list = Recipe.find(favorites)     # recipesテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
      @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        render "edit"
      end
  end

  def unsubscribe
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root
  end

  private
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email)
  end
end
