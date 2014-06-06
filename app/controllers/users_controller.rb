class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def signup 
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    resp_hash = {}    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: "Signed up!" }
        resp_hash[:status] = "Created"
        resp_hash[:message] = "User SignedUP Successfully"
        format.json { render :json => resp_hash.to_json }
      else
        format.html { render action: 'new' }
        resp_hash[:status] = "Failed"
        resp_hash[:message] = "User Signup has been failed."
        format.json { render :json => resp_hash.to_json }
      end
    end
  end
  
  def create
    @user = User.new(params[:user])
    resp_hash = {}    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: "Signed up!" }
        resp_hash[:status] = "Created"
        resp_hash[:message] = "User SignedUP Successfully"
        format.json { render :json => resp_hash.to_json }
      else
        format.html { render action: 'new' }
        resp_hash[:status] = "Failed"
        resp_hash[:message] = "User Signup has been failed."
        format.json { render :json => resp_hash.to_json }
      end
    end
  end
  
  def display_profile
    @user = User.find(session[:user_id])    
  end
  
  def profile_data
    @user = User.find_by_email(params[:email])
      resp_hash = {}
      respond_to do |format|              
        resp_hash[:status] = "Success"
        resp_hash[:data] = @user
        format.json { render :json => resp_hash.to_json }
     end
  end
  
  def update_profile
    @user = User.find(session[:user_id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.Adress = params[:user][:Adress]
    @user.City = params[:user][:City]
    @user.State = params[:user][:State]
    @user.zip_code = params[:user][:zip_code]
    @user.phone = params[:user][:phone]
    @user.save
    redirect_to :action => "display_profile"
  end
  
  def update_profile_data
    @user = User.find_by_email(params[:email])
    resp_hash = {}
    @user.first_name = params[:firstName]
    @user.last_name = params[:lastName]
    @user.Adress = params[:city]
    @user.City = params[:state]
    @user.State = params[:zip_code]
    @user.zip_code = params[:address]
    @user.phone = params[:phone]
    @user.save
    
    respond_to do |format|              
      resp_hash[:status] = "Success"
      resp_hash[:data] = @user
      format.json { render :json => resp_hash.to_json }
    end
  end
  
  def edit_profile
    @user = User.find(session[:user_id])
  end  
end
