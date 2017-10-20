class UsersController < ApplicationController
  def new
  end

  def show
  end


  def create
	@user = User.new(first_name:params['first_name'], last_name:params['last_name'], email:params['email'], password:params['password'])
		if @user.save
		    flash[:notice] = 'User successfully created, Now Login'
		    redirect_to '/main'
	  	else
	  		flash[:errors] = @user.errors.full_messages
	  		redirect_to '/main'
	  	end
	  end

  def edit
  end

end
