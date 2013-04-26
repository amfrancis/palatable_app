class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = 'Welcome to pa.lat.able!'
        redirect_to @user
      else
        flash[:error] = 'error'
        render "new"
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
          flash[:success] = "Profile updated"
          sign_in @user
          redirect_to @user
      else
          render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
