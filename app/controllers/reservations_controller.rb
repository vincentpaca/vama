class ReservationsController < DashboardController
  def index
    aedirect_to "/dashboard"
  end

  def show
    redirect_to edit_reservation_path(params[:id])
  end

  def new
    @reservation = Reservation.new

    begin
      @product = Product.find(params[:p])
    rescue
      @product = nil
    end

    unless @product.nil?
      unless @product.reserved
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to products_path, :alert => "Sorry, the product is already reserved."
      end
    else
      redirect_to products_path, :alert => "Sorry, we couldn't find the product you are trying to reserve."
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @product = @reservation.product

    if @reservation.user != current_user
      redirect_to "/dashboard", :alert => "You don't have access to that document."
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to edit_reservation_path(@reservation), :notice => "Reservation updated!." }
        format.js { render :json => @reservation, :status => :updated }
      else
        format.html { render :new, :alert => "Your reservation cannot be processed" }
        format.js { render :json => @reservation.errors, :status => :unprocessable_entity }
      end
    end

  end

  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.user = current_user

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to edit_reservation_path(@reservation), :notice => "Reservation sent. A representative from VAMA Motors will be in touch with you soon" }
        format.js { render :json => @reservation, :status => :created }
      else
        format.html { render :new, :alert => "Your reservation cannot be processed" }
        format.js { render :json => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end
end
