class SettingsController < ApplicationController
    def index
        Current.user = current_user
    end 
    def update
        if current_user.update(user_params)
            redirect_to settings_path
        else
            redirect_to settings_path
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :username, :website, :bio, :email, :number, :gender, :profileimage)
    end 
end 