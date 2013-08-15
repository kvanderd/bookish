# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :widget_template do
    name "MyString"
    classtype "MyString"
    code "MyText"
  end
end
