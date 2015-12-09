class DropUsersVideosTable < ActiveRecord::Migration
  def change
    drop_table :videos_users
  end
end
