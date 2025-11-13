ActiveAdmin.register LegalPage, as: "Terms and Privacy Policy" do
  permit_params :title, :content, :page_type, :status, :published_at

  # Filters
  filter :title
  filter :page_type, as: :select, collection: LegalPage.page_types.keys.map { |t| [t.titleize, t] }
  filter :status, as: :select, collection: LegalPage.statuses.keys.map { |s| [s.titleize, s] }
  filter :published_at
  filter :created_at

  # Index page
  index do
    selectable_column
    id_column
    column :title
    column :page_type do |p|
      p.page_type.titleize
    end
    column :status do |page|
      case page.status
      when "published"
        status_tag "Published", class: "status-ok"
      when "draft"
        status_tag "Draft", class: "status-warning"
      else
        status_tag page.status.titleize, class: "status-info"
      end
    end
    column :published_at
    column :created_at
    actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :title
      row :page_type do |p|
        p.page_type.titleize
      end
      row :status do |p|
        case p.status
        when "published"
          status_tag "Published", class: "status-ok"
        when "draft"
          status_tag "Draft", class: "status-warning"
        else
          status_tag p.status.titleize, class: "status-info"
        end
      end
      row :published_at
      row :content do |p|
        raw p.content
      end
      row :created_at
      row :updated_at
    end
  end

  # Form
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :page_type, as: :select, collection: LegalPage.page_types.keys.map { |type| [type.titleize, type] }
      f.input :status, as: :select, collection: LegalPage.statuses.keys.map { |status| [status.titleize, status] }
      f.input :published_at, as: :datepicker, label: "Published At", hint: "Only shown when status is published", input_html: { disabled: !f.object.published? }
    end
    f.actions
  end

  # Controller Logic
  controller do
    def update
      if params[:legal_page][:status] == 'published' && resource.draft?
        params[:legal_page][:published_at] = Time.current
      end
      super
    end
  end
end
