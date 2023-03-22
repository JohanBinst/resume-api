class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :summary
      t.string :job_title
      t.string :phone
      t.string :soft_skills
      t.string :hard_skills

      t.timestamps
    end
  end
end
