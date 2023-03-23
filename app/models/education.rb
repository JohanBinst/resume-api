class Education < ApplicationRecord
  belongs_to :resume

  validates :school, :major, :start_date, presence: true
  validates :remote, inclusion: { in: [true, false] }
end
