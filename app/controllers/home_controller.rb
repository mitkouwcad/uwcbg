class HomeController < ApplicationController
  def index
    @new_user = User.new #for the form
  end

  def register
    @email = params[:user][:email]
    @user = User.where(email: @email)
    @already_sent = false

    if @user.exists?
      @user = @user.first

      if @user.confirmed?
        session[:user_id] = @user.id
        redirect_to action: 'confirm_email'
      else
        @error = !@user.send_confirmation_email unless @user.confirmed?
        @already_sent = true
      end
    else
      @user = User.create(user_params)
      @user.save! #creates token if not there already
      
      @error = !@user.send_confirmation_email
      @user.destroy if @error #we don't need invalid emails
    end
  end

  def confirm_email

    if session[:user_id].present?
      @user = User.where(id: session[:user_id]).first
    end

    unless @user.present?  
      @user = User.where(confirmation_token: params[:token]).first
    end

    @confirmed = false

    if @user.present?
      @user.confirm! unless @user.confirmed?
      @confirmed = true
      session[:user_id] = @user.id
    end

  end

  def download_doc
    if session[:user_id].present? 
      @user = User.where(id: session[:user_id])
      if @user.exists?
        filename = 'UWC_Bulgaria_Application_Form_English_2019.doc'
        file = File.read(File.join(Rails.root,'private',filename))
        send_data file, filename: filename
      else
        redirect_to action: 'index'
      end
    else
      redirect_to action: 'index'
    end
  end

private
  def user_params
    params.require(:user).permit(:email)
  end
end
