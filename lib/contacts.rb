class Contact
  @@all_contacts = []

  def Contact.all_contacts
    @@all_contacts
  end

  def save
    @@all_contacts << self
  end

  def Contact.clear
    @@all_contacts = []
  end

  def delete_contact
    @@all_contacts.delete(self)
    @addresses = {}
    @emails = []
    @phones = {}
    @first_name = ""
    @last_name = ""
  end

  def initialize (first, last)
    @first_name = first
    @last_name = last
    @phones = {}
    @emails = []
    @addresses = {}
  end

  def name
    @first_name + " " + @last_name
  end

  def first_name
    @first_name
  end

  def edit_first_name(new_name)
    @first_name = new_name
  end

  def last_name
    @last_name
  end

  def edit_last_name(new_name)
    @last_name = new_name
  end

  def add_phone(phone)
    @phones[phone.description] = phone.number
  end

  def phone
    @phones
  end

  def edit_phone_number(phone_object, new_number)
    @phones[phone_object.description] = new_number
  end

  def add_email(email)
    @emails << email
  end
  def email
    @emails
  end

  def add_address(address)
    @addresses[address.description] = address.address
  end

  def address
    @addresses
  end

  def edit_address (address_object, new_address)
    @addresses[address_object.description] = new_address
  end

  # def view
  #   p "First Name: #{@first_name} \n Last Name: #{@last_name} \n #{@phones.keys[0]} Phone: #{@phones.values[0]} \n Email: #{@emails[0].email} \n #{@addresses.keys[0]} Address: #{@addresses.values[0]}"
  # end
end




