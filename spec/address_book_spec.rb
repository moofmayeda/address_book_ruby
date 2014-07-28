require "rspec"
require "contacts"

describe "Contact" do
  it "initializes with a new contact" do
    test_contact = Contact.new("Kyle", "Boe")
    test_contact.should be_an_instance_of Contact
  end
  it "allows you to set the first and last name of a contact" do
    test_contact = Contact.new("Kyle", "Boe")
    test_contact.name.should eq "Kyle Boe"
    test_contact.first_name.should eq "Kyle"
    test_contact.last_name.should eq "Boe"
  end
  describe "add_phone" do
    it "adds a phone number to a initialized contact" do
      test_contact = Contact.new("Kyle", "Boe")
      test_phone = Phone.new("home",3606087875)
      test_contact.add_phone(test_phone)
      test_contact.phone.should eq test_phone
    end
  end

end

describe "Phone" do
  it "initializes with a new phone number" do
    test_phone = Phone.new("mobile",3238543287)
    test_phone.should be_an_instance_of Phone
    test_phone.number.should eq 3238543287
    test_phone.description.should eq "mobile"
  end
end

describe "Email" do
  it "initializes with a new email address" do
    test_email = Email.new("ksboe1@gmail.com")
    test_email.should be_an_instance_of Email
    test_email.email.should eq "ksboe1@gmail.com"
  end
end

describe "Address" do
  it "initializes with a new address" do
    test_address = Address.new("123 Main St Portland OR 97212")
    test_address.should be_an_instance_of Address
    test_address.address.should eq "123 Main St Portland OR 97212"
  end
end

