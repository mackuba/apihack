class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :kind
      t.integer :value
    end
  end
end
