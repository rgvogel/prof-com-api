class AddProfessorToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :professor, foreign_key: true
  end
end
