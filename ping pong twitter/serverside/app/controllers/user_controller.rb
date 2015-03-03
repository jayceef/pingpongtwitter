class UserController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  after_filter :cors_set_access_control_headers

 def index
    @users = User.all
    render json: @users
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
    p "*" * 50
    p params
    p "*" * 50
    @user = User.new(first_name: params[:first_name])

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:id])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end



  private
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name)
    # end

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = "1728000"
    end
end
