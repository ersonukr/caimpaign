class Call < ActiveRecord::Base
  validates :call_sid, :phone, :status, presence: true
  
  def set_call_status(status)
    case status
    when "call-attempt"
      self.status = 1
    end
  end
end