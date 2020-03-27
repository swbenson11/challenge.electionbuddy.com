module AuditLogging
    extend ActiveSupport::Concern

    included do
      before_update :create_log
    end

    
    private

    def create_log
      self.changes.each do |change|
        AuditLog.create(
          {
            table: self.class.to_s,
            table_id: self.id,
            column: change[0],
            old_value: change[1][0],
            new_value: change[1][1],
            change_date: Time.now
          }
        )
      end
    end
end