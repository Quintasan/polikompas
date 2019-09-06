class AddImportantPointsToLawProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :law_proposals, :important_points, :string, null: false, default: ""
  end
end
