class AddColumnToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :developer, :string
  end
end
