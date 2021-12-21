require 'rails_helper'
#factorysのuserに入れているデータでバリデーションを実行する
RSpec.describe User, type: :model do
  let(:user) { build(:user) }
    describe 'ユーザーモデルのテスト' do
      it "ユーザーが保存できているかどうか" do
        expect(user.valid?).to eq true
      end
    end
    describe 'attribute: first_name' do
      context 'when present is valid' do
        it 'first_nameが存在している場合は、有効であること' do
          user.first_name = 'Tony'
          expect(user).to be_valid
        end
        it "nicknameがない場合は登録できないこと" do
          user = build(:user, nickname: nil)
          user.valid?
          p "xxxxxxxx"
          p user.errors
          expect(user.errors[:nickname]).to include("は1文字以上で入力してください")
        end
      end
      context 'when blank is invalid' do
        it 'first_nameが空白の場合は、無効であること' do
          user.first_name = ''
          expect(user).to be_invalid
          expect(user.errors[:first_name]).to include("を入力してください")
        end
      end
    end
  end
