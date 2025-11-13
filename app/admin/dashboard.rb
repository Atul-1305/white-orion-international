# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Dashboard"

  content title: "🌟 Admin Dashboard" do
    style = <<-CSS.html_safe
      <style>
        .dashboard-header {
          text-align: center;
          margin-bottom: 30px;
        }
        .dashboard-header h1 {
          font-size: 28px;
          font-weight: 700;
          color: #2c3e50;
          letter-spacing: 0.5px;
          margin-bottom: 8px;
        }
        .dashboard-header p {
          font-size: 16px;
          color: #555;
          margin: 0;
        }
        .dashboard-card {
          background: #ffffff;
          border-radius: 12px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.08);
          padding: 18px 20px;
          margin-bottom: 20px;
          transition: all 0.2s ease-in-out;
        }
        .dashboard-card:hover {
          box-shadow: 0 4px 16px rgba(0,0,0,0.12);
          transform: translateY(-3px);
        }
        .dashboard-card h3 {
          font-weight: 600;
          margin-bottom: 10px;
          color: #333;
        }
        .dashboard-card ul {
          list-style: none;
          padding-left: 0;
          margin: 0;
        }
        .dashboard-card ul li {
          margin: 6px 0;
        }
        .dashboard-card ul li a {
          text-decoration: none;
          color: #007bff;
        }
        .dashboard-card ul li a:hover {
          text-decoration: underline;
        }
        .metric {
          font-size: 14px;
          color: #666;
        }
        .metric strong {
          color: #111;
        }
      </style>
    CSS

    div do
      concat style
    end

    # 🏠 Header Section
    div class: "dashboard-header" do
      h1 "✨ Welcome to White Orion Dashboard"
      p "Monitor and manage everything from one place."
    end

    # 1️⃣ Categories & Subcategories
    columns do
      column do
        div class: "dashboard-card" do
          h3 "📦 Categories Summary"
          para class: "metric" do
            "Total: #{Category.count}, " \
            "Active: #{Category.where(status: true).count}, " \
            "Inactive: #{Category.where(status: false).count}"
          end
          ul do
            Category.order(created_at: :desc).limit(5).map do |cat|
              li link_to("• #{cat.name}", admin_category_path(cat))
            end
          end
        end
      end

      column do
        div class: "dashboard-card" do
          h3 "📂 Subcategories Summary"
          para class: "metric" do
            "Total: #{Subcategory.count}, " \
            "Active: #{Subcategory.where(status: true).count}, " \
            "Inactive: #{Subcategory.where(status: false).count}"
          end
          ul do
            Subcategory.order(created_at: :desc).limit(5).map do |sub|
              li link_to("• #{sub.name}", admin_subcategory_path(sub))
            end
          end
        end
      end
    end

    # 2️⃣ Certifications & Albums
    columns do
      column do
        div class: "dashboard-card" do
          h3 "🏅 Certifications"
          para class: "metric" do
            "Total Certifications: #{Certification.count}"
          end
          ul do
            Certification.order(created_at: :desc).limit(5).map do |cert|
              li do
                if cert.image.attached?
                  span image_tag(url_for(cert.image), height: 30, style: "border-radius: 5px; margin-right: 6px; vertical-align: middle;")
                end
                span link_to(cert.name, admin_certification_path(cert))
              end
            end
          end
        end
      end

      column do
        div class: "dashboard-card" do
          h3 "🖼️ Recent Albums"
          para class: "metric" do
            "Total Albums: #{Album.count}"
          end
          ul do
            Album.order(created_at: :desc).limit(5).map do |album|
              li link_to("• #{album.title}", admin_album_path(album))
            end
          end
        end
      end
    end

    # 3️⃣ Products & System Info
    columns do
      column do
        div class: "dashboard-card" do
          h3 "🛍️ Recent Products"
          para class: "metric" do
            "Total Products: #{Product.count}"
          end
          ul do
            Product.order(created_at: :desc).limit(5).map do |product|
              li link_to("• #{product.name}", admin_product_path(product))
            end
          end
        end
      end

      column do
        div class: "dashboard-card" do
          h3 "⚙️ System Info"
          para "Ruby Version: #{RUBY_VERSION}"
          para "Rails Version: #{Rails.version}"
          para "Environment: #{Rails.env.capitalize}"
          para "Last Updated: #{Time.current.strftime('%d %b %Y, %I:%M %p')}"
        end
      end
    end
  end
end
