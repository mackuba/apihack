class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :kind
      t.string :type
      t.string :value
      t.integer :function
      t.integer :predicate
      t.integer :true_branch
      t.integer :false_branch
      t.integer :argument
      t.string :arguments
    end
  end
end
