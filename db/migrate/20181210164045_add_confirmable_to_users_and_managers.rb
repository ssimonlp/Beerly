# frozen_string_literal: true

class AddConfirmableToUsersAndManagers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end

    change_table :managers, bulk: true do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end
  end
end
