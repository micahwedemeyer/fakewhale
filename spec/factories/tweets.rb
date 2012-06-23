# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :tweet do
    username "micahwedemeyer"
    message "Fakewhale is the shizzle!"
  end
end
