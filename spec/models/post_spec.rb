require 'rails_helper'

RSpec.describe Post, type: :model do
    
  let(:post){ build(:post) }
  
  describe "記事作成のバリデーション" do
      it "textとyoutube_urlがある場合、有効である" do
          post.valid?
          expect(post).to be_valid
      end
      
      it "textがない場合、無効である" do
          post = build(:post, text: "")
          post.valid?
          expect(post.errors[:text]).to include("can't be blank")
      end
      it "textが140文字以上の場合、無効である" do
          post = build(:post, text: "a" * 141)
          post.valid?
          expect(post.errors[:text]).to include("is too long (maximum is 140 characters)")
      end
      it "youtube_urlがない場合、無効である" do
          post = build(:post, youtube_url: "")
          post.valid?
         expect(post.errors[:youtube_url]).to include("can't be blank")
     end
      it "youtube_urlが11文字以下の場合、無効である" do
          post = build(:post, youtube_url: "a" * 10)
          post.valid?
         expect(post.errors[:youtube_url]).to include("is too short (minimum is 11 characters)")
     end
  end
  
  describe "liked_by?" do
      it "ユーザがlikeしてる場合、user_idにはユーザーのuser_idが入る" 
  end
  
end
