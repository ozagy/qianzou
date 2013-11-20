class PagesController < ApplicationController
  def home
  end
  
  def about
    
  end
  
  def gallery
    @albums = Album.all
    @photos = Photo.all
    @a_init = params[:a_name] if params[:a_name]
    @p_init = params[:p_name] if params[:p_name]
  end
  
  def contacts
    
  end
  
  def admin
    redirect_to albums_path and return if session[:admin]
    
    if params[:username]
      user = params[:username].gsub(/@.+/, '')
      u = Admin.find_by_username(user)
      if u and params[:password] == u.password
        session[:admin] = user
        logger.info 'success'
        redirect_to albums_path
      else
        redirect_to admin_path, :alert => 'Admin login failed. Incorrect username or password.'
      end
    end
  end
  
  def logout
    session.delete(:admin)
    redirect_to request.referer 
  end
end
