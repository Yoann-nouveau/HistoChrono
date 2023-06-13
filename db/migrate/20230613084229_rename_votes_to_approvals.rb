class RenameVotesToApprovals < ActiveRecord::Migration[7.0]
  def change
    rename_table :votes, :approvals
  end
end
