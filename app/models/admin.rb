class Admin < ActiveRecord::Base
  self.table_name = "admin"
  has_secure_password
  validates_presence_of :username
end
