class WebsiteDb < ActiveRecord::Migration
  def change
    create_table :blog do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :image
      t.date :created_on
      t.boolean :publish
      t.string :tags
    end

    create_table :portfolio do |t|
      t.string :name
      t.string :link
      t.text :description
      t.string :image
      t.date :created_on
      t.boolean :show
    end
  end
end
