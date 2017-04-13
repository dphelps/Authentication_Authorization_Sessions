class DemosController < ApplicationController
    skip_before_action :authorize
    
    def new
        render 'new'
    end
    
    def create
        user = User.find_by(email: params[:demo][:email].downcase)
        if user && user.authenticate(params[:demo][:password])
            log_in user
            redirect_to user
        else
            flash.now[:danger] = 'Invalid email/password'
            render 'new'
        end
    end
    
    def destroy
        logout
        redirect_to root_url
    end
end
