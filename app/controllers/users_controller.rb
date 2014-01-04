class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  respond_to :json, :html

  def index
    @users = User.paginate(page: params[:page])
    
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    

  case params[:category]
    when 'Health'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Health", @user.id).paginate(page: params[:page])
    when 'Fitness'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Fitness", @user.id).paginate(page: params[:page])
    when 'Family'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Family", @user.id).paginate(page: params[:page])
    when 'Religion'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Religion", @user.id).paginate(page: params[:page])  
    when 'Relations'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Relations", @user.id).paginate(page: params[:page])
    when 'Leadership'
      @microposts = Micropost.where("category == ? AND user_id = ?", "Leadership", @user.id).paginate(page: params[:page])
    else
     @microposts = @user.microposts.paginate(page: params[:page]) 
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Tb!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
