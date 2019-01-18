class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :header
      t.string :description

      t.timestamps
    end
  end
end
