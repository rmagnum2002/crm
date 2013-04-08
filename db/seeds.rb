# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: "rubydeve@gmail.com", password: "admin2013", first_name: "Alexandru", last_name: "Leasenco" },
  { email: "rmagnum2002@gmail.com", password: "admin2013", first_name: "Sergiu", last_name: "Rosca" },
  ])

companies = Company.create([
  { user_id: 1, name: "Webng", phone: "079703515" , fax: "079703515" , email: "info@webng.md" , skype: "webng", website: "webng.md" , facebook: "facebook.com/webng", bank_req: "123456789", fisc_id: "123456789" },
  { user_id: 1, name: "Simtravel", phone: "022242424" , fax: "022242424" , email: "info@simtravel.md" , skype: "simtravel", website: "simtravel.md" , facebook: "facebook.com/simtravel", bank_req: "123456789", fisc_id: "123456789" }
  ])

company_branch = CompanyBranch.create([
  { name: "Accounting" },
  { name: "Telecommunications" },
  { name: "Banks" }
  ])

company_source = CompanySource.create([
  { source: "VaroInform" },
  { source: "Internet" },
  { source: "Makler" }
  ])

client_category = ClientCategory.create([
  { category: "Own client" },
  { category: "Resolved client" }
  ])

client_type = ClientType.create([
  { client_type: "Potential client" },
  { client_type: "Dealer" }
  ])

client_status = ClientStatus.create([
  { client_status: "First contact" },
  { client_status: "Client" }
  ])

organizational_form = OrganizationalForm.create([
  { organizational_form: "LTD" },
  { organizational_form: "ONG" }
  ])

employee = Employee.create([
  { user_id: 1, first_name: "Ivan", last_name: "Pupkin", patronymic: "Vasilievici", gender: "male", language: "Russian", company_id: 1,
    decision: false, phone: 123456789, mobile: 123456789, simtravel: 123456789, email: "vasea@gmail.com", skype: "vasea" }
  ])

