class Experience < ApplicationRecord
  belongs_to :resume
  validates :company, :job_title, :start_date, :description, presence: true
end
