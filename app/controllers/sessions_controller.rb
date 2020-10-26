class SessionsController < ApplicationController

    # def new
    #     @user = User.new
    # end

    def omniauth
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
        if user.valid?
            redirect_to user_path
        else
            redirect_to login_path
        end
    end

    # def create
    #     @user = User.find_by(username: params[:username])
    #     if @user && @user.authenticate(params[:password])
    #         session[:user_id] = @user.id
    #         redirect_to user_path(@user)
    #     else
    #         render :new
    #     end
    # end

    # def destroy
    #     session.clear
    #     redirect_to login_path
    # end

    private 
    
    def auth
        request.env['omniauth.auth']
    end
end
