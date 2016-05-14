class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  protect_from_forgery with: :exception
<<<<<<< HEAD

  include SessionsHelper
=======
  def index
    render "/layouts/index.html.erb"
  end

>>>>>>> d6dfc91c9596e2d3370317ccd3e0adde92fff297
end
