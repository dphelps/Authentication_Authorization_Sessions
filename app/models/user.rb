class User < ApplicationRecord
    before_save :set_default_role
    has_secure_password
    
    enum role: [:student, :faculty, :staff, :admin]
    
    
    private
    
    def set_default_role
       self.role ||= :student 
    end
end
