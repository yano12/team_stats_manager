class AddColumnToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :email, :string
  end
end
