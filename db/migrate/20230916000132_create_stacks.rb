class CreateStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :stacks do |t|
      t.string :description, limit: 32
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
