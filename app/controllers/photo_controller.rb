class PhotoController < ApplicationController
  def get_all
    @photos = Photo.all.order(:created_at => :desc)
    render({ :template => "photo_templates/all"})
  end

  def create_entry
    image = params['input_image']
    caption = params['input_caption']
    owner_id = params['input_owner_id']

    photo = Photo.new(image: image, caption: caption, owner_id: owner_id)
    photo.save

    redirect_to("/photos/#{photo.id}")
  end

  def update_photo    
    image = params['input_image']
    caption = params['input_caption']
    id = params['id']

    post = Photo.where(id: id)[0]
    post.update(image: image, caption: caption)
    redirect_to("/photos/#{id}")

  end

  def create_comment
    photo_id = params['input_photo_id']
    author_id = params['input_author_id']
    comment = params['input_comment']

    msg = Comment.new(photo_id: photo_id, author_id: author_id, body: comment)
    msg.save
    redirect_to("/photos/#{photo_id}")
  end

  def delete_photo
    id = params['id']
    photo = Photo.where(id: id)[0]
    photo.destroy
    redirect_to('/photos')
  end

  def get_photo
    id = params['id']
    @post = Photo.where(id: id)[0]

    @comments = @post.comments
    render({ :template => "photo_templates/single_user"})
  end
end
