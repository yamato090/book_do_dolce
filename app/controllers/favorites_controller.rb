class FavoritesController < ApplicationController
    before_action :set_recipe
    before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  def create
      @recipe = Recipe.find(params[:recipe_id])
      favorite = @recipe.favorites.new(user_id: current_user.id)
      favorite.save
      flash[:success] = "Liked recipe"
      redirect_to request.referer
  end

  def destroy
      @recipe = Recipe.find(params[:recipe_id])
      favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
      favorite.destroy
      redirect_to request.referer
  end
  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
