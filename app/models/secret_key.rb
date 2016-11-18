class SecretKey < ApplicationRecord
  validates_presence_of :user_key, :admin_key
end
