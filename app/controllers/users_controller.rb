class UsersController < ApplicationController
# skip_before_action :authorize
  # before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.js { render inline: "location.reload();" }
        format.html { redirect_to root_url  }
      end
    else
      # binding.pry
      respond_to do |format|
        format.js { }
        format.html { redirect_to root_url  }
      end
    end
  end

  def edit
    @user = set_user
    tip = Tip.find(params[:tip_id])
    unless current_user.tips.include?(tip)
      current_user.tips.push(tip)
      current_user.save
    end
    respond_to do |format|
      format.js { }
      format.html { redirect_to root_url  }
    end
  end

  def delete_tip
    @tip = Tip.find(params[:tip_id])
    @tip_id = @tip.id
    current_user.tips.destroy(@tip)
    respond_to do |format|
      format.js { }
      format.html { redirect_to root_url  }
    end
  end

  def destroy
      @user.destroy
      @user = User.new
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :id, :email, :password, :password_confirmation)
    end
end
