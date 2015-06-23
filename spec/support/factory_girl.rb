require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title "This is a title that should be greater than 40 characters long."
    description "This is a description that is more than 150 chatacters long. Maybe. Now. Hopefully. Do dee dooo da. La dee dada. Do dee dooo da. La dee dada. Do dee dooo da. La dee dada. Do dee dooo da. La dee dada."
  end
end
