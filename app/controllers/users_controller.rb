class UsersController < ApplicationController

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

  private

  def user_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation, :salt, :encrypted_password)
  end
end
