class Answer < ApplicationRecord
  include AuditLogging

  belongs_to :question
end
