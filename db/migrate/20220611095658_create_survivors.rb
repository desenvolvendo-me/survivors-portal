class CreateSurvivors < ActiveRecord::Migration[6.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
