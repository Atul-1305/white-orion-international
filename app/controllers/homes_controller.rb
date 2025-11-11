class HomesController < ApplicationController
  def index
        @directors = Director.order(:sort_order)   # <-- add this
    @featured_products = Product.where(status: true).limit(6) #
  end

  def faq
    @faqs = Faq.where(active: true).order(position: :asc)
  end

  def contact; end

  def contact_submit
    contact_params = params.require(:contact).permit(:name, :email, :phone, :support_type, :message)
    ContactMailer.with(contact: contact_params.to_h).contact_us_email.deliver_later
    redirect_to contact_path, notice: "Thank you — your message has been sent. We'll get back to you soon."
  rescue => e
    Rails.logger.error("Contact form error: #{e.class} #{e.message}")
    redirect_to contact_path, alert: "There was an error sending your message. Please try again later."
  end

  def privacy
    @legal_page = LegalPage.published.find_by(page_type: :privacy_policy)
    render 'legal_page'
  end

  def terms
    @legal_page = LegalPage.published.find_by(page_type: :terms_and_conditions)
    render 'legal_page'
  end

  def brochure
    @brochure = Brochure.where(active: true).order(created_at: :desc).first
  end
  def about
    @sections = AboutSection.order(:position)
    @directors = Director.order(:sort_order)
  end
  def album
    @albums = Album.order(created_at: :desc) 
  end
end
