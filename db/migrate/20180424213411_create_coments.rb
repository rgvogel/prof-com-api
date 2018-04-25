class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.string :title
      t.string :student
      t.text :message

      t.timestamps
    end
  end
end
