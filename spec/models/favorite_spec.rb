require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { build(:favorite) }
    describe 'いいねモデルのテスト' do
      it "いいねが保存できているかどうか" do
        expect(favorite.valid?).to eq true
      end
    end
  end
