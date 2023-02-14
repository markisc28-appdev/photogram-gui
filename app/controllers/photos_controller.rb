class PhotosController < ApplicationController
  def index
    
    render({ :template => "photos_template/index.html.erb"})
  end
end
