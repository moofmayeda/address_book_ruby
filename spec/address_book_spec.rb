require "rspec"
require "contacts"
require "email"
require "phone"
require "address"

describe "Contact" do
  before do
    Contact.clear
  end
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
      test_phone = Phone.new("home",5646087875)
      test_contact.add_phone(test_phone)
      test_contact.phone["home"].should eq 5646087875
    end
    it "adds multiple phone numbers with descriptions to an initailized contact" do
      test_contact = Contact.new("Kyle","Boe")
      home_phone = Phone.new("home",3606087875)
      work_phone = Phone.new("work",4656087875)
      mobile_phone = Phone.new("mobile",5646087875)
      test_contact.add_phone(home_phone)
      test_contact.add_phone(work_phone)
      test_contact.add_phone(mobile_phone)
      test_contact.phone["mobile"].should eq 5646087875
    end
  end
  describe "add_email" do
    it "adds an email address to an initailized contact" do
      test_contact = Contact.new("Kyle", "Boe")
      test_email = Email.new("ksboe1@gmail.com")
      test_contact.add_email(test_email)
      test_contact.email.should eq [test_email]
    end
    it "adds multiple email addresses to an initialized contact" do
      test_contact = Contact.new("Kyle", "Boe")
      email1 = Email.new("ksboe1@gmail.com")
      email2 = Email.new("ksboe1@sharklasers.com")
      email3 = Email.new("ksboe1@kickpuncher.com")
      test_contact.add_email(email1)
      test_contact.add_email(email2)
      test_contact.add_email(email3)
      test_contact.email.should eq [email1, email2, email3]
    end
  end
  describe "add_address" do
    it "adds an address to an initialized contact" do
      test_contact = Contact.new("Kyle", "Boe")
      test_address = Address.new("home","123 Main St Portland OR 98685")
      test_contact.add_address(test_address)
      test_contact.address["home"].should eq "123 Main St Portland OR 98685"
    end
  end
  describe "edit_first_name" do
    it "edits a contact's name" do
      test_contact = Contact.new("Kyle","Boe")
      test_contact.edit_first_name("Keith")
      test_contact.first_name.should eq "Keith"
    end
  end
  describe "edit_last_name" do
    it "edits a contact's last name" do
      test_contact = Contact.new("Kyle", "Boe")
      test_contact.edit_last_name("Bow")
      test_contact.last_name.should eq "Bow"
    end
  end
  describe "edit_phone_number" do
    it "edits a contact's phone number" do
      test_contact = Contact.new("Kyle", "Boe")
      home_phone = Phone.new("home",3606087875)
      work_phone = Phone.new("work",4656087875)
      test_contact.add_phone(home_phone)
      test_contact.add_phone(work_phone)
      test_contact.edit_phone_number(work_phone, 5656087875)
      test_contact.phone["work"].should eq 5656087875
    end
  end
  describe "edit_address" do
    it "edits a contact's address" do
      test_contact = Contact.new("Kyle", "Boe")
      test_address = Address.new("home","123 Main St Portland OR 98685")
      test_contact.add_address(test_address)
      test_contact.edit_address(test_address, "456 Couch St Portland OR 12345")
      test_contact.address["home"].should eq "456 Couch St Portland OR 12345"
    end
  end

  describe "delete_contact" do
    it "deletes a contact" do
      test_contact = Contact.new("Kyle","Boe")
      test_address = Address.new("home","123 Main St Portland OR 98685")
      home_phone = Phone.new("home",3606087875)
      email1 = Email.new("ksboe1@gmail.com")
      test_contact.add_address(test_address)
      test_contact.add_phone(home_phone)
      test_contact.add_email(email1)
      test_contact.save
      test_contact.delete_contact
      Contact.all_contacts.should eq []
      test_contact.phone["home"].should eq nil
      test_contact.email.should eq []
    end
  end
  # describe "view" do
    # it "should return everything in the contact" do
    #   test_contact = Contact.new("Kyle", "Boe")
    #   test_phone = Phone.new("mobile", 3606087875)
    #   test_email = Email.new("ksboe1@gmail.com")
    #   test_address = Address.new("home","123 Main St Portland OR 98685")
    #   test_contact.add_email(test_email)
    #   test_contact.add_address(test_address)
    #   test_contact.add_phone(test_phone)
    #   test_contact.view.should eq "First Name: Kyle \n Last Name: Boe \n mobile Phone: 3606087875 \n Email: ksboe1@gmail.com \n home Address: 123 Main St Portland OR 98685"
    # end
  # end
  describe ".all_contacts" do
    it "is empty at first" do
      Contact.all_contacts.should eq []
    end
    it "should add a contact to the contact list of names" do
      test_contact = Contact.new("Kyle", "Boe")
      test_contact.save
      Contact.all_contacts.should eq [test_contact]
    end
  end
  describe ".clear" do
    it "empties all the contacts" do
      test_contact = Contact.new("Kyle", "Boe").save
      Contact.clear
      Contact.all_contacts.should eq []
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
  it "initializes with a description and new address" do
    test_address = Address.new("home","123 Main St Portland OR 97212")
    test_address.should be_an_instance_of Address
    test_address.address.should eq "123 Main St Portland OR 97212"
  end
end

