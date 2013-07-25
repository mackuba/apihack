class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :kind
      t.integer :value
      t.integer :function
      t.integer :predicate
      t.integer :true_branch
      t.integer :false_branch
      t.string :arguments
    end
  end
end
