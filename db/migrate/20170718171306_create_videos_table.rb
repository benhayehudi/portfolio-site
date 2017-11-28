class CreateVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.string :image
      t.string :tags
      t.date :created_on
      t.boolean :publish
    end
  end
end
