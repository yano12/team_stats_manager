class AddPasswordDigestToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :password_digest, :string
  end
end
