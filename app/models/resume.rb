class Resume < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  belongs_to :user

  validates :first_name, :last_name, :email, :summary, :job_title, :phone, :soft_skills, :hard_skills, presence: true
end
