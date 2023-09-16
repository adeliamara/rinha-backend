class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :nickname, limit: 32
      t.string :name, limit: 100
      t.date :birth_date

      t.timestamps
    end
    add_index :people, :nickname, unique: true
  end
end
