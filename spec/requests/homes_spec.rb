require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /top" do
  end

  describe "Check the display of the top screen" do
  	before do
      visit root_path
    end
    
    context 'トップ画面の表示確認' do
	  it 'トップ画面にレシピの一覧ページへのリンクが表示されているか' do
	    expect(page).to have_link "", href: recipes_path
	  end

	  it 'トップ画面にログイン画面へのページへのリンクが表示されているか' do
	    expect(page).to have_link "", href: new_user_registration_path
	  end

	  it 'トップ画面に新規登録画面へのページへのリンクが表示されているか' do
	    expect(page).to have_link "", href: new_user_session_path
	  end

	  it 'トップ画面にABOUT画面へのページへのリンクが表示されているか' do
	    expect(page).to have_link "", href: home_about_path
	  end

	  it 'トップ画面にTOP画面へのリンクが表示されているか' do
	    expect(page).to have_link "", href: root_path
	  end

	  it 'トップ画面にユーザーの一覧ページへのリンクが表示されているか' do
	    expect(page).to have_link "", href: users_path
	  end

	  it 'root_pathが"/"であるか' do
	    expect(current_path).to eq('/')
	  end
    end
  end
end