class AddUserToToDos < ActiveRecord::Migration[5.2]
  def change
    add_reference :to_dos, :user, foreign_key: true
  end
end
