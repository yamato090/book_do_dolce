class HomesController < ApplicationController

  def top
      #レシピを新着順で投稿表示  created_atは作成日時　descは降順   ascは昇順
      @recipes = Recipe.all.order(created_at: :desc)
      #レシピをいいね順で投稿表示  a.favorites_users.size、b.favorites_users.size が表しているのはそれぞれ各投稿のいいね数。各投稿のいいね数を比較して昇順で並び替えている。
      @recipe = Recipe.includes(:favorites_users).sort {|a,b| b.favorites_users.size <=> a.favorites_users.size}
  end

  def about

  end
end
