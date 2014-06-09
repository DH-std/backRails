class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player
      t.string :game_type
      t.integer :bet

      t.timestamps
    end
    add_index :games, :player

    create_table :hands do |t|
      t.integer :game
      t.boolean :player_hand

      t.timestamps
    end
    add_index :hands, :game

    create_table :cards do |t|
      t.integer :game
      t.integer :hand
      t.boolean :dealt
      t.string  :suit
      t.integer :rank

      t.timestamps
    end
    add_index :cards, [:game, :hand]
  end
end