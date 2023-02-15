class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "users_template/index.html.erb"})
  end

  def show
    url_username = params.fetch("username")

   matching_usernames = User.where({:username => url_username})

   @the_user = matching_usernames.first

   render({ :template => "users_template/show.html.erb"})
  end

  def create
    input_user = params.fetch("query_user")

    a_new_user = User.new

    a_new_user.username = input_user

    a_new_user.save

 
    #render({ :template => "photos_template/create.html.erb"})

    redirect_to("/users/" + a_new_user.username)
  end

  def update
    the_id = params.fetch("modify_id")

    matching_users = User.where({ :username => the_id})

    the_user = matching_users.at(0)

    input_username = params.fetch("query_username")
    
    the_user.username = input_username

    the_user.save

    redirect_to("/users/" + the_user.username)
  end
end
