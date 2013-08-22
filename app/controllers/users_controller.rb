class UsersController < ApplicationController

  def index
  end

  def create
    puts "I am in create" * 9
    ap params
    @user = User.create(params[:user])
    login(@user)
    redirect_to root_path
  end


  def show
    @user = User.find(params[:id]) 
  end

  def new
    @user = User.new
  end

end