class RemoveFavoriteFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :favorite, :boolean
  end
end
