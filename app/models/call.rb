class Call < ActiveRecord::Base
  validates :call_sid, :phone, :status, presence: true
  
  scope :closed_call, -> { where(closed: false) }

  def set_call_status(status)
    case status
    when "call-attempt"
      self.status = 1
    end
  end
end