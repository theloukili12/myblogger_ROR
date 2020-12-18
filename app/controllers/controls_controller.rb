class ControlsController < ApplicationController
  def login
    if request.post?
      user =User.find_by(:email=>params[:email], :password =>params[:password])
        if !user.nil?
            session[:user] = user.id
            redirect_to root_url, notice:"Thank you for signing up"
        else
          respond_to do |format|
            format.html {render :new}
            format.json {render json: @user.errors, statuts: :unprocessable_entity}
        end
      end
    end
  end
  def logout
    session[:user]=nil
    redirect_to root_url, notice: "Thank you for signing out"
  end
end


