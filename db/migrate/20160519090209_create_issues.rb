class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
    	t.string :heading
    	t.text :description
    	t.string :ticket_no
      t.timestamps null: false
    end
  end
end
