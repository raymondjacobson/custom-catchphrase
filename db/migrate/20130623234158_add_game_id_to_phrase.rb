class AddGameIdToPhrase < ActiveRecord::Migration
  def change
  	add_column :phrases, :game_id, :integer
  end
end
