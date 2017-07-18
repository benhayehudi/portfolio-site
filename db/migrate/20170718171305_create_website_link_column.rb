class CreateWebsiteLinkColumn < ActiveRecord::Migration
  def change
    add_column :portfolio, :website_link, :string
  end
end
