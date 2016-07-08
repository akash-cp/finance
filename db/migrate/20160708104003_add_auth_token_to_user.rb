class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :text
  end
end
