class AddTeamNameToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :team_name, :string
  end
end
