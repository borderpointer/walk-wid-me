class CreateVideosandUsers < ActiveRecord::Migration
  def change
    create_table :videos_users, id: false do |t|
      t.belongs_to :video, index: true
      t.belongs_to :user, index: true
    end
  end
end
