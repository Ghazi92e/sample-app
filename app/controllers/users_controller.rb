class UsersController < ApplicationController
  before_action :authenticate, :only => [:index, :edit, :update]
  before_action :correct_user, :only => [:edit, :update]

  def index
    @titre = "Tous les utilisateurs"
    @user = User.all
  end

  def edit
    @titre = "Édition profil"
  end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def new
    @user = User.new #pour creer formulaire d'inscription
    @title = "S'inscrire"
  end

  def create
    @user = User.new(user_params)
    if @user.save # Traite un succès d'enregistrement.
      flash[:success] = "Bienvenue dans l'Application Exemple !"
      redirect_to @user
    else
      @titre = "Sign up"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    @titre = "Édition profil"
  end

  private

    def user_params
      params.require(:user).permit(:nom, :email, :password, :password_confirmation, :salt, :encrypted_password)
    end

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


  
end
