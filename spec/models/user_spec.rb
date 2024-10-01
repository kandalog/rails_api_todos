require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it "登録可能" do
      user = build(:user)
      expect(user.valid?).to eq(true)
    end
    it "name, email, password_digestが必須" do
      user = build(:user, name: nil, email: nil, password_digest: nil)
      # validation messageを入れ込むためにvalid?する
      user.valid?
      require_validation_messages = ["Name can't be blank", "Email is invalid", "Email is invalid"]
      expect(user.errors.full_messages).to include(*require_validation_messages)
    end
    it "passwordは8文字以上" do
      user = build(:user, password_digest: "1234567")
      expect(user.valid?).to eq(false)
    end
    it "不正なemail形式はブロック" do
      user = build(:user, email: "hoge.come")
      expect(user.valid?).to eq(false)
    end
  end
end
