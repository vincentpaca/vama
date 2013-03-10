ActiveAdmin.register Reservation do
  config.per_page = 10
  config.clear_action_items!

  index do
    column :product
    column :user
    column :created_at
    column :approved
    default_actions
  end

  form do |f|
    f.inputs "Label" do
      f.input :approved
    end
    f.actions
  end

  show do |r|
    attributes_table do
      row :user
      row :product
      row :approved
      row :info_sheet do
        if r.info_sheet.present?
          link_to("Download", r.info_sheet.url(:download => true))
        else
          "No File Available"
        end
      end

      row :deposit_slip do
        if r.deposit_slip.present?
          link_to("Download", r.deposit_slip.url(:download => true))
        else
          "No File Available"
        end
      end

      row :ids do
        if r.ids.present?
          link_to("Download", r.ids.url(:download => true))
        else
          "No File Available"
        end
      end

      row :photo do
        if r.photo.present?
          link_to("Download", r.photo.url(:download => true))
        else
          "No File Available"
        end
      end

      row :proof_income do
        if r.proof_income.present?
          link_to("Download", r.proof_income.url(:download => true))
        else
          "No File Available"
        end
      end

      row :dti do
        if r.dti.present?
          link_to("Download", r.dti.url(:download => true))
        else
          "No File Available"
        end
      end

      row :created_at
      row :updated_at
    end
  end
end
