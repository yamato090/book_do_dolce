class SearchesController < ApplicationController
    before_action :authenticate_user!, except: [:search]

    def search
      @model=params[:model]
      @content=params[:content]
      @method=params[:method]
      if @model == 'user'
        @user = current_user
        @users = User.search_for(@content,@method).page(params[:page]).per(10)
      else
        @recipes = Recipe.search_for(@content,@method).page(params[:page]).per(10)
      end
    end
end