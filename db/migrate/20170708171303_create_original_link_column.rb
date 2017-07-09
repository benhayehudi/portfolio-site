class CreateOriginalLinkColumn < ActiveRecord::Migration
  def change
    add_column :blog, :original_link, :string
  end
end
