class AddVoteableToVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :voteable, polymorphic: true, null: false
  end
end
