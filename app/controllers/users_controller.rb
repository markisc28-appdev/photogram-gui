class UsersController < ApplicationController
  def index
    
    render({ :template => "users_template/index.html.erb"})
  end
end
