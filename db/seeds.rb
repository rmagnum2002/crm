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
  { user_id: 1, responsible_id: 1, name: "Webng", company_branch_id: 1, company_source_id: 1, client_category_id: 1, client_type_id: 1,
    client_at: Time.now, phone: "079703515", fax: "079703515" , email: "info@webng.md" , skype: "webng", website: "webng.md" ,
    facebook: "facebook.com/webng", bank_req: "123456789", fisc_id: "123456789", client_status_id: 1, number_employees: 3,
    organizational_form_id: 1 },
  { user_id: 2, responsible_id: 1, name: "Simtravel", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
    client_at: Time.now, phone: "022242424", fax: "022242424" , email: "info@simtravel.md" , skype: "simtravel", website: "simtravel.md" ,
    facebook: "facebook.com/simtravel", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
    organizational_form_id: 2 }
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

job_title = JobTitle.create([
  { job_title: "Consultant" },
  { job_title: "Sales Manager" }
  ])

employee = Employee.create([
  { user_id: 1, first_name: "Ivan", last_name: "Pupkin", patronymic: "Vasilievici", gender: "male", birthday: Time.now.years_ago(30),
    language: "Russian", company_id: 1, job_title_id: 1, decision: false, phone: 123456789, mobile: 123456789, simtravel: 123456789,
    email: "vasea@gmail.com", skype: "vasea", facebook: "vasea", client_date: Time.now, completion: "no" },
  { user_id: 2, first_name: "Vasilisa", last_name: "Prekrasnaea", patronymic: "Vasilievna", gender: "female", birthday: Time.now.years_ago(20),
    language: "Russian", company_id: 2,job_title_id: 1, decision: false, phone: 987654321, mobile: 987654321, simtravel: 987654321,
    email: "vasilisa@gmail.com", skype: "vasilisa", facebook: "vasilisa", client_date: Time.now, completion: "no" }
  ])

address = Address.create([
  { company_id: 1, address_type: "fiscal", country: "Moldova", city: "Chisinau", postal_code: "2020", street: "Dacia", street_number: "20",
    bank_details: "123456789", fiscal_code: "987654321" },
  { company_id: 1, address_type: "invoicing", country: "Moldova", city: "Chisinau", postal_code: "2001", street: "Stefan cel Mare", street_number: "200",
    bank_details: nil, fiscal_code: nil }
  ])
