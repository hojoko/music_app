require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { build(:user) }
  
  describe "アカウント作成のバリデーション" do

      it "name,email,passwordがある場合、有効である" do
        expect(user).to be_valid
      end
      
      it "nameがない場合、無効である" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank" )
      end
      
      it "nameが50文字以上の場合、無効である" do
        user = build(:user, name: "a" * 51)
        user.valid?
        expect(user.errors[:name]).to include("is too long (maximum is 50 characters)") 
      end
      
      it "emailがない場合、無効である" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank" )
      end
      
      it "emailが50文字以上の場合、無効である" do
        user = build(:user, email: "a" * 51)
        user.valid?
        expect(user.errors[:email]).to include("is too long (maximum is 50 characters)") 
      end
      
      it "emailが同じ場合、無効である" do
        user1 = create(:user)
        user2 = build(:user)
        user2.valid?
        expect(user2.errors[:email]).to include("has already been taken") 
      end
      
      it "passwordがない場合、無効である" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      
      it "passwordが6文字以下の場合、無効である" do
        user = build(:user, password: "a" * 5)
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)") 
      end
  end
  
end
