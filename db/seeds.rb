# db/seeds.rb

# ✅ Ensure default admin exists in development
  AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end


# ✅ FAQs seed (idempotent – won’t duplicate)
faqs = [
  {
    question: "What services does your company offer?",
    answer: "We specialize in providing comprehensive import and export services for a wide range of products, including agricultural produce, industrial goods, and consumer products. Our services include sourcing, quality assurance, logistics, and customs clearance.",
    position: 1
  },
  {
    question: "How can I contact your customer service team?",
    answer: "You can contact our customer service team via email at info@whiteoriongroup.com or by phone at +91 7804018499. We are also available through our online contact form on the website.",
    position: 2
  },
  {
    question: "What products do you export?",
    answer: "We export a wide range of products, including agricultural produce like spices, grains, fruits, and vegetables, as well as manufactured goods such as textiles and industrial products. Please check our Products page for more information.",
    position: 3
  },
  {
    question: "Which countries or regions do you export to?",
    answer: "Our team has extensive experience working with clients from around the world and is well-versed in the cultural nuances, legal requirements, and logistical challenges associated with international trade.",
    position: 4
  },
  {
    question: "What shipping methods do you use?",
    answer: "We use various shipping methods, including air freight, sea freight, and land transportation, depending on the destination and nature of the goods. We ensure timely and safe delivery through reliable logistics partners.",
    position: 5
  },
  {
    question: "How do you handle customs clearance?",
    answer: "Our experienced team manages all aspects of customs clearance, ensuring compliance with international trade regulations. We handle the necessary documentation and coordinate with customs authorities to facilitate smooth transactions.",
    position: 6
  },
  {
    question: "How do you ensure sustainability and ethical practices?",
    answer: "We are committed to sustainable and ethical practices. We work with suppliers who adhere to environmental regulations and ethical labor practices. We continuously strive to minimize our environmental impact.",
    position: 7
  },
  {
    question: "What sets White Orion International apart from other export companies?",
    answer: "At White Orion International, we pride ourselves on our commitment to superior quality, competitive pricing, prompt delivery, and exceptional customer service. Our dedication to these pillars sets us apart in the export industry.",
    position: 8
  }
]

faqs.each do |faq_data|
  Faq.find_or_create_by!(question: faq_data[:question]) do |faq|
    faq.answer = faq_data[:answer]
    faq.position = faq_data[:position]
  end
end

puts "✅ Admin user and FAQs seeded successfully!"
