class AddPhrasesToGames < ActiveRecord::Migration
  def change
  	add_column :games, :phrases, :text
  end
end
