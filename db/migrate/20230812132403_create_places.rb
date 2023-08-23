class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :body
      t.float :latitude
      t.float :longitude
      t.string :image_id  # 「refile」による画像保存用
      t.integer :user_id

      t.timestamps
    end
  end
end
