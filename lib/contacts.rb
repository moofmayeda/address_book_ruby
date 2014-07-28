class Contact
  def initialize (first, last)
    @first_name = first
    @last_name = last
    @phones = []
  end

  def name
    @first_name + " " + @last_name
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def add_phone(phone)
    @phones << phone
  end

  def phone
    @phones[0]
  end
end

class Phone
  def initialize(description, number)
    @description = description
    @number = number
  end

  def number
    @number
  end

  def description
    @description
  end
end

class Email
  def initialize(email)
    @email = email
  end

  def email
    @email
  end
end

class Address
  def initialize(address)
    @address = address
  end

  def address
    @address
  end
end
