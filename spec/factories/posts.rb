FactoryBot.define do
  factory :post do
    user_id {create(:user).id }
    text {"lorem ipsum"}
    youtube_url {"a" * 11}
  end
end
