class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :fname
      t.string :lname
      t.string :subject
      t.string :thumbnail

      t.timestamps
    end
  end
end
