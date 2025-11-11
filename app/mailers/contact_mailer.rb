class ContactMailer < ApplicationMailer
  default from: 'no-reply@whiteorioninternational.com'

  def contact_us_email
    @contact = params[:contact] || {}
    support_email = ENV['SUPPORT_EMAIL'].presence || 'support@whiteorioninternational.com'
    mail(
      to: support_email,
      subject: "Contact Us: #{@contact['support_type'].to_s.titleize} — #{@contact['name']}"
    )
  end
end
