class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.string :school
      t.string :program
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
