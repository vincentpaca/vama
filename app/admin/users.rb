ActiveAdmin.register User do
  config.per_page = 10
  config.comments = false

  index do
    column :email
    column :last_sign_in_at
    column :created_at
    default_actions
  end

  show do |user|
    attributes_table do
      row :name
      row :address do
        user.profile.address
      end
      row :contact_number do
       user.profile.contact_number
      end
      row :email
      row :created_at
      row :last_sign_in_at
    end

    panel "Payment History" do
      table_for(user.payments) do
        column "Purchase" do |payment|
          link_to payment.purchase.name, admin_purchase_path(payment.purchase)
        end
        column "Amount" do |payment|
          payment.amount
        end
        column "Date" do |payment|
          payment.created_at.strftime("%d %b %Y")
        end
        column "Actions" do |payment|
          link_to "View Payment Details", admin_payment_path(payment)
        end
      end
    end
  end
end
