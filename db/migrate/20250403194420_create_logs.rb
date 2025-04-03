class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.string :action
      t.integer :dinamica_id
      t.jsonb :data_anterior
      t.jsonb :data_nova

      t.timestamps
    end
  end
end
