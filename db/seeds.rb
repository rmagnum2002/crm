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
  client_at: Time.now, phone: "079703515", fax: "079703515" , email: "mail@webng.org" , skype: "webng", website: "webng.md" ,
  facebook: "facebook.com/webng", bank_req: "123456789", fisc_id: "123456789", client_status_id: 1, number_employees: 3,
  organizational_form_id: 1 },
  { user_id: 2, responsible_id: 1, name: "Simtravel", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242424", fax: "022242424" , email: "contact@simtravel.md" , skype: "simtravel", website: "simtravel.md" ,
  facebook: "facebook.com/simtravel", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "LM-WebLaboratory", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242425", fax: "022242425" , email: "info@weblaboratory.com" , skype: "weblaboratory", website: "weblaboratory.md" ,
  facebook: "facebook.com/weblaboratory", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "BTG International", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242426", fax: "022242426" , email: "office@btginternational.md" , skype: "btginternational", website: "btginternational.md" ,
  facebook: "facebook.com/btginternational", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Creativ Soft SRL", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242427", fax: "022242427" , email: "support@creativsoft.md" , skype: "creativsoft", website: "creativsoft.md" ,
  facebook: "facebook.com/creativsoft", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Discont.md", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242428", fax: "022242428" , email: "info@discont.com" , skype: "discont", website: "discont.md" ,
  facebook: "facebook.com/discont", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "GLOBAL NPN", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242429", fax: "022242429" , email: "info@globalnpn.md" , skype: "globalnpn", website: "globalnpn.md" ,
  facebook: "facebook.com/globalnpn", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "INTWAY", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242430", fax: "022242430" , email: "info@intway.md" , skype: "intway", website: "intway.md" ,
  facebook: "facebook.com/intway", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Magic Web", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242431", fax: "022242431" , email: "office@magicweb.md" , skype: "magicweb", website: "magicweb.md" ,
  facebook: "facebook.com/magicweb", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Multi Port", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242432", fax: "022242432" , email: "info@multiport.md" , skype: "multiport", website: "multiport.md" ,
  facebook: "facebook.com/multiport", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Raxus Studio", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242433", fax: "022242433" , email: "info@raxusstudio.org" , skype: "raxusstudio", website: "raxusstudio.md" ,
  facebook: "facebook.com/raxusstudio", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Reduceri MD", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242434", fax: "022242434" , email: "info@reduceri.md" , skype: "reduceri", website: "reduceri.md" ,
  facebook: "facebook.com/reduceri", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Vetal Web", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242435", fax: "022242435" , email: "office@vetalweb.com" , skype: "vetalweb", website: "vetalweb.md" ,
  facebook: "facebook.com/vetalweb", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Orange", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242436", fax: "022242436" , email: "mail@orange.md" , skype: "orange", website: "orange.md" ,
  facebook: "facebook.com/orange", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Moldcell", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242437", fax: "022242437" , email: "info@moldcell.md" , skype: "moldcell", website: "moldcell.md" ,
  facebook: "facebook.com/moldcell", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Moldtelecom", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242438", fax: "022242438" , email: "info@moldtelecom.md" , skype: "moldtelecom", website: "moldtelecom.md" ,
  facebook: "facebook.com/moldtelecom", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Neuron", company_branch_id: 2, company_source_id: 1, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242424", fax: "022242424" , email: "office@neuron.com" , skype: "neuron", website: "neuron.md" ,
  facebook: "facebook.com/neuron", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Voxnet", company_branch_id: 2, company_source_id: 2, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242439", fax: "022242439" , email: "mail@voxnet.md" , skype: "voxnet", website: "voxnet.md" ,
  facebook: "facebook.com/voxnet", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Allied Testing", company_branch_id: 2, company_source_id: 2, client_category_id: 2, client_type_id: 2,
  client_at: Time.now, phone: "022242440", fax: "022242440" , email: "info@alliedtesting.md" , skype: "alliedtesting", website: "alliedtesting.md" ,
  facebook: "facebook.com/alliedtesting", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
  organizational_form_id: 2 },
  { user_id: 2, responsible_id: 1, name: "Web Tech", company_branch_id: 2, company_source_id: 1, client_category_id: 1, client_type_id: 2,
  client_at: Time.now, phone: "022242441", fax: "022242441" , email: "office@webtech.md" , skype: "webtech", website: "webtech.md" ,
  facebook: "facebook.com/webtech", bank_req: "123456789", fisc_id: "123456789", client_status_id: 2, number_employees: 10,
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
  { user_id: 1, title: 1, first_name: "Ivan", last_name: "Pupkin", patronymic: "Vasilievici", gender: 0, birthday: Time.now.years_ago(30),
  language: 0, company_id: 1, job_title_id: 1, decision: false, phone: 123456789, mobile: 123456789, simtravel: 123456789,
  email: "ivan@gmail.com", skype: "ivan", facebook: "ivan", client_date: Time.now, completion: "no" },
  { user_id: 2, title: 0, first_name: "Ana", last_name: "Tinkova", patronymic: "Vasilievna", gender: 1, birthday: Time.now.years_ago(20),
  language: 1, company_id: 1, job_title_id: 1, decision: false, phone: 987654321, mobile: 987654321, simtravel: 987654321,
  email: "ana@gmail.com", skype: "ana", facebook: "ana", client_date: Time.now, completion: "no" },
  { user_id: 2, title: 1, first_name: "John", last_name: "Mitch", patronymic: "Michael", gender: 0, birthday: Time.now.years_ago(40),
  language: 2, company_id: 1, job_title_id: 2, decision: false, phone: 987654321, mobile: 987654321, simtravel: 987654321,
  email: "john@gmail.com", skype: "john", facebook: "john", client_date: Time.now, completion: "no" },
  { user_id: 2, title: 1, first_name: "Jim", last_name: "Carrey", patronymic: "Simon", gender: 0, birthday: Time.now.years_ago(45),
  language: 2, company_id: 1, job_title_id: 1, decision: false, phone: 987654321, mobile: 987654321, simtravel: 987654321,
  email: "jim@gmail.com", skype: "jim", facebook: "jim", client_date: Time.now, completion: "no" }
])

address = Address.create([
  { company_id: 1, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2020", street: "Dacia", street_number: "20" },
  { company_id: 1, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2001", street: "Zelinski", street_number: "200" },
  { company_id: 2, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 2, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 3, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 3, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 4, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 4, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 5, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 5, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 6, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 6, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 7, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 7, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 8, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 8, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 9, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 9, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 10, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 10, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 11, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2020", street: "Dacia", street_number: "20" },
  { company_id: 11, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2001", street: "Zelinski", street_number: "200" },
  { company_id: 12, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 12, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 13, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 13, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 14, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 14, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 15, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 15, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 16, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 16, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 17, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 17, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 18, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 18, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 19, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 19, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" },
  { company_id: 20, address_type: 0, country: "Moldova", city: "Chisinau", postal_code: "2004", street: "Decebal", street_number: "25" },
  { company_id: 20, address_type: 1, country: "Moldova", city: "Chisinau", postal_code: "2070", street: "Traian", street_number: "30" }
  ])
