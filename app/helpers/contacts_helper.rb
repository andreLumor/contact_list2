module ContactsHelper
  def render_default_if_true(phone)
    if phone.default_phone == true
      render inline: "<p class='bg-indigo-500 text-indigo-50 px-3 py-1 rounded-md text-sm justify-self-end'> default </p>" 
    end
  end

  def render_email_if_exists(contact)
    unless contact.email == nil
      render(:partial => "contacts/email", :locals => {:email => contact.email})
    end
  end
end
