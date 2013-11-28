crm
===

Create databases and run migrations
----
rake db:create
rake db:migrate db:seed
----

Edit /etc/hosts and add
----
127.0.0.1 team1.crm.tld
----

Start web server:

----
ruby run.rb
QUERY_TRACE=1 ruby run.rb # start with logging stack trace of sql queries
----

Open http://team1.crm.tld:3000/ in the browser.

Login details
email: info@webng.md
pass: admin2013

Open http://team1.crm.tld:3000/admin/ .

email: admin@example.com
pass: password


Docs
----

Version changing to a model
https://github.com/airblade/paper_trail

Devise for authentication with warned
https://github.com/plataformatec/devise

Authorization component
https://github.com/ryanb/cancan

Active Admin
http://www.activeadmin.info/documentation.html
http://www.activeadmin.info/docs/13-authorization-adapter.html#using_the_cancan_adapter


abre ???
