Rails.application.routes.draw do
  get("/", { :controller => "user", :action => "get_all" })

  get('users', {:controller => 'user', :action => "get_all"})
  get('users/:username', {:controller => 'user', :action => "get_user"})
  post('add_user', {:controller => 'user', :action => "create_entry"})
  post('update_user/:id', {:controller => 'user', :action => "edit_entry"})

  get('photos', {:controller => 'photo', :action => "get_all"})
  get('photos/:id', {:controller => 'photo', :action => "get_photo"})
  post('insert_photo_record', {:controller => 'photo', :action => "create_entry"})
  post('add_comment', {:controller => 'photo', :action => "create_comment"})
  post('update_photo/:id', {:controller => 'photo', :action => "update_photo"})
  get('delete_photo/:id', {:controller => 'photo', :action => "delete_photo"})
end
