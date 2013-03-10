class PurchasesController < DashboardController
  def index
    redirect_to '/dashboard'
  end

  def export_to_csv
    @purchase = Purchase.find(params[:id])
    send_data @purchase.payments_to_csv
  end

  def show
    @purchase = Purchase.find(params[:id])
    @payments = @purchase.payments

    if @purchase.user != current_user
      redirect_to "/dashboard", :alert => "You dont have access to that document." and return
    end

    respond_to do |f|
      f.html
      f.js
    end
  end
end
