class AddUserToResume < ActiveRecord::Migration[7.0]
  def change
    add_reference :resumes, :user, index: true, foreign_key: true
  end
end
