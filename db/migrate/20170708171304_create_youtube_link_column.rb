class CreateYoutubeLinkColumn < ActiveRecord::Migration
  def change
    add_column :portfolio, :youtube_link, :string
    add_column :portfolio, :blog_link, :string
  end
end
