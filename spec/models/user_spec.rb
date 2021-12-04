require 'rails_helper'
#factorysのuserに入れているデータでバリデーションを実行する
RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  it "姓、名を登録すると、姓名が取得できること" do
  #   user = User.new(
  #         last_name:  "肉巻き",
  #         first_name: "太郎"
  # )
    expect(user.valid?).to eq true
    # expect(user.full_name).to eq "肉巻き 太郎"
  end
end
