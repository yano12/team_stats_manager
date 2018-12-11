class AddColumnToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :in_reply_to, :integer, default: 0, index: true
  end
end
