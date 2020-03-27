class Voter < ApplicationRecord
  include AuditLogging

  belongs_to :election
end
