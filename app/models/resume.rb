class Resume < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
end
