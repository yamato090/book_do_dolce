require 'rails_helper'

RSpec.describe RecipeComment, type: :model do
  let(:recipe_comment) { build(:recipe_comment) }
    describe 'レシピコメントモデルのテスト' do
      it "レシピコメントが保存できているかどうか" do
        expect(recipe_comment.valid?).to eq true
      end
    end

    describe 'attribute: comment' do
      context 'when present is valid' do
        it 'commentが存在している場合は、有効であること' do
          recipe_comment.comment = 'Tony'
          expect(recipe_comment).to be_valid
        end
      end

      context 'when blank is invalid' do
        it 'commentが空白の場合は、無効であること' do
          recipe_comment.comment = ''
          expect(recipe_comment).to be_invalid
          expect(recipe_comment.errors[:comment]).to include("を入力してください")
        end
      end

      context 'when nil is invalid' do
        it 'commentが存在していない場合は、無効であること' do
          recipe_comment.comment = nil
          expect(recipe_comment).to be_invalid
          expect(recipe_comment.errors[:comment]).to include("を入力してください")
        end
      end

      context 'when length is 50 characters or less is valid' do
        it 'commentが50文字以下の場合は、有効であること' do
          recipe_comment.comment = 'a' * 50
          expect(recipe_comment).to be_valid
        end
      end

      context 'when length is more than 50 characters is invalid' do
        it 'commentが50文字を超える場合は、無効であること' do
          recipe_comment.comment = 'a' * 51
          expect(recipe_comment).to be_invalid
          expect(recipe_comment.errors[:comment]).to include('は50文字以内で入力してください')
        end
      end
    end
  end

