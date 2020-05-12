class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
    
    validates :stripe_customer_id, uniqueness: true
  
    after_create :attendance_send
  
    def attendance_send
      AttendanceMailer.attendance_email(self).deliver_now
    end
end
