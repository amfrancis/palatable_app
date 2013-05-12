FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    username "mhartl"
    password "foobarbar"
    password_confirmation "foobarbar"

    factory :admin do
      admin true
    end
  end

  factory :bookmark do
    content "loremipsum.com"
    user
  end
end
