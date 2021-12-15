class HomesController < ApplicationController
  
  def top
      #レシピを新着順で投稿表示  created_atは作成日時　descは降順   ascは昇順
      @recipes = Recipe.all.order(created_at: :desc)
  end

  def about

  end
end
