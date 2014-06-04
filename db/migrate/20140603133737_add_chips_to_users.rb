class AddChipsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chips, :integer, default: 100
  end
end
