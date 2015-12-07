class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.boolean :favorite

      t.timestamps null: false
    end
  end
end
