class UsersController < ApplicationController
  def index 
  	@list = User.new
  	@lists = User.all.each
  end

  def create
  	User.create params.require(:user).permit(:name)
  	redirect_to:back
  end

  def edit	
  	@list = User.find params[:id]
  end

  def update
  	@list = User.find params[:id]
  	if @list.update_attributes params.require(:user).permit(:name)
  		redirect_to users_path, :notice => "Updated successfully!"

  	else
  		redirect_to edit_user_path, :alert => "There was an error."
  	end
  end

  def destroy
  	User.destroy params[:id]
  	redirect_to:back, :notice => "Deleted successfully!"
  end
end
