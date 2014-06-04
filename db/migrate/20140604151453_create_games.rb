class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :game_type
      t.integer :bet
      t.string :player_hand
      t.string :dealer_hand

      t.timestamps
    end
    add_index :games, [:user_id, :game_type]
  end
end
