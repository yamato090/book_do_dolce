require 'rails_helper'
#factorysのrecipeに入れているデータでバリデーションを実行する
RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }
    describe 'レシピモデルのテスト' do
      it "レシピが保存できているかどうか" do
        expect(recipe.valid?).to eq true
      end
    end

    describe 'attribute: name' do
      context 'when present is valid' do
        it 'nameが存在している場合は、有効であること' do
          recipe.name = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'nameが空白の場合は、無効であること' do
          recipe.name = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:name]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'nameが存在していない場合は、無効であること' do
          recipe.name = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:name]).to include("を入力してください")
        end
      end

      context 'when length is 40 characters or less is valid' do
        it 'nameが40文字以下の場合は、有効であること' do
          recipe.name = 'a' * 40
          expect(recipe).to be_valid
        end
      end

      context 'when length is more than 40 characters is invalid' do
        it 'first_nameが40文字を超える場合は、無効であること' do
          recipe.name = 'a' * 41
          expect(recipe).to be_invalid
          expect(recipe.errors[:name]).to include('は40文字以内で入力してください')
        end
      end
    end

    describe 'attribute: description' do
      context 'when present is valid' do
        it 'descriptionが存在している場合は、有効であること' do
          recipe.description = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'descriptionが空白の場合は、無効であること' do
          recipe.description = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:description]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'descriptionが存在していない場合は、無効であること' do
          recipe.description = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:description]).to include("を入力してください")
        end
      end

      context 'when length is 200 characters or less is valid' do
        it 'nameが200文字以下の場合は、有効であること' do
          recipe.description = 'a' * 200
          expect(recipe).to be_valid
        end
      end

      context 'when length is more than 200 characters is invalid' do
        it 'descriptionが200文字を超える場合は、無効であること' do
          recipe.description = 'a' * 201
          expect(recipe).to be_invalid
          expect(recipe.errors[:description]).to include('は200文字以内で入力してください')
        end
      end
    end

    describe 'attribute: procedure' do
      context 'when blank is invalid' do
        it 'procedureが空白の場合は、無効であること' do
          recipe.procedure = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:procedure]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'procedureが存在していない場合は、無効であること' do
          recipe.procedure = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:procedure]).to include("を入力してください")
        end
      end

      context 'when length is 3000 characters or less is valid' do
        it 'procedureが3000文字以下の場合は、有効であること' do
          recipe.procedure = 'a' * 3000
          expect(recipe).to be_valid
        end
      end

      context 'when length is more than 3000 characters is invalid' do
        it 'procedureが3000文字を超える場合は、無効であること' do
          recipe.procedure = 'a' * 3001
          expect(recipe).to be_invalid
          expect(recipe.errors[:procedure]).to include('は3000文字以内で入力してください')
        end
      end
    end

    describe 'attribute: ingredients' do
      context 'when present is valid' do
        it 'ingredientsが存在している場合は、有効であること' do
          recipe.ingredients = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'ingredientsが空白の場合は、無効であること' do
          recipe.ingredients = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:ingredients]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'ingredientsが存在していない場合は、無効であること' do
          recipe.ingredients = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:ingredients]).to include("を入力してください")
        end
      end

      context 'when length is 500 characters or less is valid' do
        it 'ingredientsが500文字以下の場合は、有効であること' do
          recipe.ingredients = 'a' * 500
          expect(recipe).to be_valid
        end
      end

      context 'when length is more than 500 characters is invalid' do
        it 'ingredientsが500文字を超える場合は、無効であること' do
          recipe.ingredients = 'a' * 501
          expect(recipe).to be_invalid
          expect(recipe.errors[:ingredients]).to include('は500文字以内で入力してください')
        end
      end
    end

    describe 'attribute: calories' do
      context 'when present is valid' do
        it 'caloriesが存在している場合は、有効であること' do
          recipe.calories = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'caloriesが空白の場合は、無効であること' do
          recipe.calories = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:calories]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'caloriesが存在していない場合は、無効であること' do
          recipe.calories = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:calories]).to include("を入力してください")
        end
      end

      context 'when length is 30 characters or less is valid' do
        it 'caloriesが30文字以下の場合は、有効であること' do
          recipe.calories = 'a' * 30
          expect(recipe).to be_valid
        end
      end
    end

    describe 'attribute: cost' do
      context 'when present is valid' do
        it 'costが存在している場合は、有効であること' do
          recipe.cost = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'costが空白の場合は、無効であること' do
          recipe.cost = ''
          expect(recipe).to be_invalid
          expect(recipe.errors[:cost]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'costが存在していない場合は、無効であること' do
          recipe.cost = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:cost]).to include("を入力してください")
        end
      end

      context 'when length is 30 characters or less is valid' do
        it 'costが30文字以下の場合は、有効であること' do
          recipe.cost = 'a' * 30
          expect(recipe).to be_valid
        end
      end
    end

    describe 'attribute: image' do
      context 'when present is valid' do
        it 'imageが存在している場合は、有効であること' do
          recipe.image = 'Tony'
          expect(recipe).to be_valid
        end
      end

      context 'when nil is invalid' do
        it 'imageが存在していない場合は、無効であること' do
          recipe.image = nil
          expect(recipe).to be_invalid
          expect(recipe.errors[:image]).to include("を入力してください")
        end
      end
    end
  end


