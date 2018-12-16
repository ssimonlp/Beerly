# frozen_string_literal: true

class AddIndexToUsersAndManagers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :confirmation_token, unique: true
    add_index :managers, :confirmation_token, unique: true
  end
end
