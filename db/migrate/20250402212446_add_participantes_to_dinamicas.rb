class AddParticipantesToDinamicas < ActiveRecord::Migration[7.1]
  def change
    add_column :dinamicas, :participantes, :text, array: true, default: []
  end
end