class CreateAdminTable < ActiveRecord::Migration
  def change
    create_table :admin do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
