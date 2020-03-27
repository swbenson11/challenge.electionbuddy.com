class Question < ApplicationRecord
  include AuditLogging

  belongs_to :election
  has_many :answers
end
