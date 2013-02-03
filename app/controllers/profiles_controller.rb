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
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to edit_profile_path(@profile), :notice => "Successfully updated profile!" }
        format.js { head :no_content }
      else
        format.html { render :action => "edit" }
        format.js { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
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
