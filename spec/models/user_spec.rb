require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it "登録可能" do
      user = build(:user)
      
      binding.irb
      
      expect(user.valid?).to eq(true)
    end
  end
  
end
