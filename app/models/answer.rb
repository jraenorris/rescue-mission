class Answer < ActiveRecord::Base
  belongs_to :question

  validates :answer, uniqueness: {scope: :question_id}, presence: true, length: { minimum: 50 }
  validates :question_id, presence: true


end
