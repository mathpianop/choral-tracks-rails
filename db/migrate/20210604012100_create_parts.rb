class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.references :song, null: false, foreign_key: true
      t.string :inital
      t.binary :recording
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
