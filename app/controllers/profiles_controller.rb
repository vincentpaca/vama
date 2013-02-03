class ProfilesController < DashboardController
  before_filter :check_ownership, :only => [ :show, :edit ]

  def index
    redirect_to "/dashboard"
  end

  def show
    redirect_to edit_profile_path(current_user.profile)
  end

  def edit
    @profile = current_user.profile

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update

  end

  protected

  def check_ownership
    begin
      redirect_to "/dashboard", :alert => "You don't have permission to access that profile" if Profile.find(params[:id]) != current_user.profile
    rescue
      redirect_to "/dashboard", :alert => "You don't have permission to access that profile"
    end
  end
end
