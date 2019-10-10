# frozen_string_literal: true

class AddConfirmationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table(:users) do |t|
      t.column :confirmation_token, :string, default: nil
      t.column :confirmed_at, :datetime
    end
  end
end
