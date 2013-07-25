class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.integer :value
    end
  end
end
