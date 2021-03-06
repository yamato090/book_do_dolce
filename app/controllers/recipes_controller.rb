class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :colect_user, only: [:edit, :update]


  def index
      @user = current_user
      @recipecount = Recipe.all
      @recipes = Recipe.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
      @recipe = Recipe.new
  end

  def show
      @recipe = Recipe.find(params[:id])
      @recipes = Recipe.all
      @user = @recipe.user
      @recipe_comment = RecipeComment.new
      @recipe_comments = RecipeComment.where(recipe_id: @recipe.id).order(created_at: :desc).page(params[:page]).per(3)
  end

  def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        @recipes = Recipe.all
        render 'new'
      end
  end

  def edit
      @recipe = Recipe.find(params[:id])
  end

  def update
      @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
      else
        render "edit"
      end
  end

  def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to recipes_path
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
