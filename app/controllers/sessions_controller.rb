class SessionsController < ApplicationControlller

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params(:username))
        if @user && @user.authenticate(password: params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end

end
