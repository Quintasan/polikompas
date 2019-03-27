# frozen_string_literal: true

class CreateLawProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :law_proposals do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
