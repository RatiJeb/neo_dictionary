class ImplementSoftDelete < ActiveRecord::Migration[8.0]
  def change
    add_column :words, :deleted_at, :datetime
    add_index :words, :deleted_at

    add_column :other_qualifications, :deleted_at, :datetime
    add_index :other_qualifications, :deleted_at
  end
end
