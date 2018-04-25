class AddProfessorToComent < ActiveRecord::Migration[5.2]
  def change
    add_reference :coments, :professor, foreign_key: true
  end
end
