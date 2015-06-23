class Question < ActiveRecord::Base
  has_many :answers
  # has_many :users

  validates :title, length: { minimum: 40 }, uniqueness: true, presence: true
  validates :description, length: { minimum: 150 }, uniqueness: true, presence: true
end
