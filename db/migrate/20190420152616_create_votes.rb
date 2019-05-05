# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE vote_type AS ENUM ('upvote', 'downvote');
    SQL
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
    add_column :votes, :type, :vote_type
    add_index :votes, :type
  end

  def down
    drop_table :votes
    execute <<-SQL
      DROP TYPE vote_type;
    SQL
  end
end
