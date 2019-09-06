class AddTagsToLawProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :law_proposals, :tags, :string, array: true, default: []
    add_index :law_proposals, :tags, using: "gin"
  end
end
