class PagesController <ApplicationController
  skip_before_action :authenticate_user!

  def homepage
    #instance variable
    @message = "This is my homepage that you are currently viewing"
  end

  def about
  end

end
