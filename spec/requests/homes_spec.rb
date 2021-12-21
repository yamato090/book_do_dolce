require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /top" do
    context '表示の確認' do
	    it 'トップ画面(root_path)にレシピの一覧ページへのリンクが表示されているか' do
	     visit root_path
	     expect(page).to have_link "", href: recipes_path
	    end
    end
  end
end