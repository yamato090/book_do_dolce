class RecipesController < ApplicationController
  before_action :colect_user, only: [:edit, :update]
  
  
  def index
      @user = current_user
      @recipes = Recipe.all.page(params[:page]).per(10)
  end

  def new
      @recipe = Recipe.new
  end
  
  def show
      @recipe = Recipe.find(params[:id])
      @recipes = Recipe.all
      @user = @recipe.user
  end
  
  def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        @recipes = Recipe.all
        render 'index'
      end
  end

  def edit
  end
  
  def update
  end 
  
  def destroy
  end
  
  private
  def colect_user
    user = Recipe.find(params[:id]).user
    if current_user.id != user.id
      redirect_to recipes_path
    end
  end
  
  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :description, :procedure, :ingredients, :calories, :cost, :image)
  end
end
