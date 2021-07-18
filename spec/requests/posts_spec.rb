require 'rails_helper'

RSpec.describe "Posts", type: :request do
  
  
  describe "GET #index" do
    context "未ログイン" do
      it "レスポンスのステータスが302" do
        get posts_path
        expect(response).to have_http_status "302"
      end
    end
    
  end
end
