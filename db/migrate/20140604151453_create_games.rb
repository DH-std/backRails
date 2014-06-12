class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer  :user_id
      t.string   :game_type
      t.integer  :bet

      t.timestamps
    end
    add_index :games, :user_id

    # create_table :hands do |t|
    #   t.integer :game_id
    #   t.boolean :is_user_hand

    #   t.timestamps
    # end
    # add_index :hands, :game_id

    create_table :cards do |t|
      t.integer :game_id
      # t.integer :hand_id
      t.integer :holder, default: 0
      t.string  :suit
      t.string  :rank
      t.integer :value

      t.timestamps
    end
    add_index :cards, [:game_id, :holder]
  end
end