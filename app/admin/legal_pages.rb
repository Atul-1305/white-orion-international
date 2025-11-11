ActiveAdmin.register LegalPage do
  permit_params :title, :content, :page_type, :status, :published_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :page_type, as: :select, collection: LegalPage.page_types.keys.map { |type| [type.titleize, type] }
      f.input :status, as: :select, collection: LegalPage.statuses.keys.map { |status| [status.titleize, status] }
      f.input :published_at, as: :datepicker if f.object.published?
    end
    f.actions
  end

  controller do
    def update
      if params[:legal_page][:status] == 'published' && resource.draft?
        params[:legal_page][:published_at] = Time.current
      end
      super
    end
  end
end
