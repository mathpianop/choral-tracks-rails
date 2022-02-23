class CreateChoirs < ActiveRecord::Migration[6.0]
  def change
    create_table :choirs do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
