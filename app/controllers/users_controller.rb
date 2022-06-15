# frozen_string_literal: true

# basic user class for crud operations
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  around_action :measure_time, only: %i[destroy]

  def measure_time
    start = Time.now
    yield
    duration = Time.now - start
    Rails.logger.info "#{controller_name}##{action_name}: #{duration}s"
  end

  def index
    @pagy, @users = pagy(User.all)
  end

  def show
  end

  def about
  end

  def new
    @user = User.new
  end

  def edit
    puts params[:user]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_mail.deliver_now
      respond_to do |format|
        format.html { redirect_to users_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }\
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
