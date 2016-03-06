class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :color
      t.string :title
      t.string :font
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
