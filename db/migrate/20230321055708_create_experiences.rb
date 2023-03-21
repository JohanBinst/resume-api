class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :company
      t.string :description
      t.string :job_title
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
