class OrganizationsController < ApplicationController

  def index
  	@groups = Organization.all
  end

  def show
  	@group = Organization.find(params[:id])
  end

  def create 
	  @group = Organization.new(name:params['name'], description:params['description'], user: current_user)
	  	if @group.save
	   		flash[:notice] = 'Group successfully created'
	   		Member.create(organization: @group, user: current_user)
			redirect_to '/groups'
		else
			flash[:errors] = @group.errors.full_messages
			puts flash[:errors]
			redirect_to '/groups'
		end
	end

  def destroy
 	Organization.destroy(params['group_id'])
 	redirect_to '/groups'
  end


 def join
    group = Organization.find(params[:group_id])
    Member.create(organization: group, user: current_user)
    redirect_to '/groups/' + group.id.to_s
  end

  def unjoin 
    group = Organization.find(params[:group_id])
    member = Member.where(organization: group, user: current_user)
    Member.destroy(member)
    redirect_to '/groups/' + group.id.to_s
  end




end
