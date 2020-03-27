class AuditLog < ApplicationRecord
    validates :table, :table_id, :column, :old_value, :new_value, presence: true
end