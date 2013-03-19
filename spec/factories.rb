FactoryGirl.define do
  factory :user do #By passing the symbol :user to the factory command, we tell Factory Girl that the subsequent definition is for a User model object.
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
  	content "Hi Guys from FactoryGirl"
  	user
  end
end