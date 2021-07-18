require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  it "ユーザー登録" do
    visit new_user_path
    fill_in "Name", with: "taro"
    fill_in "Email", with: "taro@example.com"
    fill_in "Password", with: "tarotaro"
    click_on "アカウント作成"
    expect(page).to have_content "ユーザーを作成しました"
  end
    
  it "foobarでログインする"
  it "foobarの詳細画面で編集と削除ボタンが表示される"
  it "foobarが作成した記事が表示される"
  
  
end
