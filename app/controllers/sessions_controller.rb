class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.authenticate(params[:email], params[:password])
      resp_hash = {}
#       if user        
#         session[:user_id] = user.id
#         redirect_to root_url, :notice => "Logged in!"
#       else
#         flash.now.alert = "Invalid email or password"
#         render "new"
#       end
      respond_to do |format|
        if user
          session[:user_id] = user.id
          format.html { redirect_to root_url, notice: "Logged in!" }
          resp_hash[:status] = "Created"
          resp_hash[:message] = "User Logged in Succesfully"
          format.json { render :json => resp_hash.to_json }
        else
          format.html { render action: 'new' }
          resp_hash[:status] = "Failed"
          resp_hash[:message] = "Invalid email or password"
          format.json { render :json => resp_hash.to_json }
        end
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
end