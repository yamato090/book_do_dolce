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
      end

      context 'when blank is invalid' do
        it 'first_nameが空白の場合は、無効であること' do
          user.first_name = ''
          expect(user).to be_invalid
          expect(user.errors[:first_name]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'first_nameが存在していない場合は、無効であること' do
          user.first_name = nil
          expect(user).to be_invalid
          expect(user.errors[:first_name]).to include("を入力してください")
        end
      end

      context 'when length is 20 characters or less is valid' do
        it 'first_nameが20文字以下の場合は、有効であること' do
          user.first_name = 'a' * 20
          expect(user).to be_valid
        end
      end

      context 'when length is more than 20 characters is invalid' do
        it 'first_nameが20文字を超える場合は、無効であること' do
          user.first_name = 'a' * 21
          expect(user).to be_invalid
          expect(user.errors[:first_name]).to include('は20文字以内で入力してください')
        end
      end
    end

    describe 'attribute: last_name' do
      context 'when present is valid' do
        it 'last_nameが存在している場合は、有効であること' do
          user.last_name = 'Tony'
          expect(user).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'last_nameが空白の場合は、無効であること' do
          user.last_name = ''
          expect(user).to be_invalid
          expect(user.errors[:last_name]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'last_nameが存在していない場合は、無効であること' do
          user.last_name = nil
          expect(user).to be_invalid
          expect(user.errors[:last_name]).to include("を入力してください")
        end
      end

      context 'when length is 20 characters or less is valid' do
        it 'last_nameが20文字以下の場合は、有効であること' do
          user.last_name = 'a' * 20
          expect(user).to be_valid
        end
      end

      context 'when length is more than 20 characters is invalid' do
        it 'last_nameが20文字を超える場合は、無効であること' do
          user.last_name = 'a' * 21
          expect(user).to be_invalid
          expect(user.errors[:last_name]).to include('は20文字以内で入力してください')
        end
      end
    end

    describe 'attribute: nickname' do
      context 'when present is valid' do
        it 'nicknameが存在している場合は、有効であること' do
          user.nickname = 'Tony'
          expect(user).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'nicknameが空白の場合は、無効であること' do
          user.nickname = ''
          expect(user).to be_invalid
          expect(user.errors[:nickname]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'nicknameが存在していない場合は、無効であること' do
          user.nickname = nil
          expect(user).to be_invalid
          expect(user.errors[:nickname]).to include("を入力してください")
        end
      end

      context 'when length is 30 characters or less is valid' do
        it 'nicknameが30文字以下の場合は、有効であること' do
          user.nickname = 'a' * 30
          expect(user).to be_valid
        end
      end

      context 'when length is more than 30 characters is invalid' do
        it 'nicknameが20文字を超える場合は、無効であること' do
          user.nickname = 'a' * 31
          expect(user).to be_invalid
          expect(user.errors[:nickname]).to include('は30文字以内で入力してください')
        end
      end
    end

    describe 'attribute: email' do
      context 'when present is invalid' do
        it 'emailが存在している場合は、有効であること' do
          user.email = 'tony@example.com'
          expect(user).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'emailが空白の場合は、無効であること' do
          user.email = ' '
          expect(user).to be_invalid
          expect(user.errors[:email]).to include("を入力してください")
        end
      end

      context 'when empty is invalid' do
        it 'emailが空の場合は、無効であること' do
          user.email = ''
          expect(user).to be_invalid
          expect(user.errors[:email]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'emailが存在していない場合は、無効であること' do
          user.email = nil
          expect(user).to be_invalid
          expect(user.errors[:email]).to include("を入力してください")
        end
      end

      context 'when length is 50 characters or less is valid' do
        it 'emailが255文字以下の場合は、有効であること' do
          user.email = 'a' * 243 + '@example.com'
          expect(user).to be_valid
        end
      end

      context 'when length is more than 50 characters s invalid' do
        it 'emailが255文字を超える場合は、無効であること' do
          user.email = 'a' * 244 + '@example.com'
          expect(user).to be_invalid
          expect(user.errors[:email]).to include('は255文字以内で入力してください')
        end
      end

      context 'when correct format is valid' do
        it 'emailの形式が正しい場合は、有効であること' do
          user.email = 'user@example.com'
          expect(user).to be_valid

          user.email = 'USER@foo.COM'
          expect(user).to be_valid

          user.email = 'A_US-ER@foo.bar.org'
          expect(user).to be_valid

          user.email = 'foo.bar@baz.jp'
          expect(user).to be_valid

          user.email = 'foo+bar@baz.cn'
          expect(user).to be_valid
        end
      end

      context 'when is incorrect format is invalid' do
        it 'emailの形式が正しくない場合は、無効であること' do
          user.email = 'user@example,com'
          expect(user).to be_invalid

          user.email = 'user_at_foo.org'
          expect(user).to be_invalid

          user.email = 'user.name@example.'
          expect(user).to be_invalid

          user.email = 'foo@bar_baz.com'
          expect(user).to be_invalid

          user.email = 'foo@bar+baz.com'
          expect(user).to be_invalid
        end
      end

      context 'when already taken is invalid' do
        it '同一のemailが既に登録されている場合は、無効であること' do
          FactoryBot.create(:user, email: 'tony@example.com')
          user.email = 'tony@example.com'
          expect(user).to be_invalid
          expect(user.errors[:email]).to include('はすでに存在します')
        end
      end

      context 'when case insensitive and not unipue is invalid' do
        it 'emailの大文字と小文字を区別せず、一意ではない場合は、無効であること' do
          FactoryBot.create(:user, email: 'tony@example.com')
          user.email = 'TONY@EXAMPLE.COM'
          expect(user).to be_invalid
          expect(user.errors[:email]).to include('はすでに存在します')
        end
      end

      context 'when case insensitive and not unipue is saved in lowercase' do
        it 'emailが小文字で保存されていること' do
          user.email = 'TONY@EXAMPLE.COM'
          user.save!
          expect(user.reload.email).to eq 'tony@example.com'
        end
      end
    end
  end
