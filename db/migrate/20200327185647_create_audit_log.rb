class CreateAuditLog < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_logs do |t|
      t.string :table
      t.integer :table_id
      t.string :column
      t.text :old_value
      t.text :new_value
      t.datetime :change_date
    end
  end
end
