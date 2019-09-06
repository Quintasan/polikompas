# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :commentable, polymorphic: true, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
