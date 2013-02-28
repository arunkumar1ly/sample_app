class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy] # Note that we haven’t restricted the actions the before filter applies to since it applies to them both by default. If we were to add, say, an index action accessible even to non-signed-in users, we would need to specify the protected actions explicitly.
  before_filter :correct_user,   only: :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = [] #empty instance variable
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private 

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end

end