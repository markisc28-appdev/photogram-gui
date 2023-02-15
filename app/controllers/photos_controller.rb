class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photos_template/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photos_template/show.html.erb"})
  end

  def delete
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({:template => "photos_template/delete.html.erb"})

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

 
    #render({ :template => "photos_template/create.html.erb"})

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def new_comment
    photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => photo_id})

    the_photo = matching_photos.at(0)

    input_author = params.fetch("query_author")
    input_comment = params.fetch("query_comment")

    a_new_comment = Comment.new

    a_new_comment.author_id = input_author
    a_new_comment.photo_id = photo_id
    a_new_comment.body = input_comment

    a_new_comment.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end
end
