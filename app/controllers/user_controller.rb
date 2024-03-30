class UserController < ApplicationController
  def get_all
    @users = User.all.order({ :created_at => :desc })
    render({ :template => "user_templates/all" })
  end

  def create_entry
    nick = params['input_username']
    new_user = User.new(username: nick)
    new_user.save

    redirect_to("/users/#{nick}")
  end

  def get_user
    nick = params['username']
    @user = User.where(username: nick)[0]
    @posts = @user.own_photos

    render({ :template => "user_templates/single_user" })
  end

  def edit_entry
    new_nick = params['input_username']
    old_id = params['id']

    user = User.where(id: old_id)[0]
    user.update(username: new_nick)

    redirect_to("/users/#{user.username}")

  end
end
