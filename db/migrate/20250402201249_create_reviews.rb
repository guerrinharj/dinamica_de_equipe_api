class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :dinamica, null: false, foreign_key: true
      t.text :comentario
      t.integer :nota

      t.timestamps
    end
  end
end
