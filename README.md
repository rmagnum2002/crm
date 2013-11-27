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
bundle exec thin start
----

Open http://team1.crm.tld:3000/ in the browser.

Login details
email: info@webng.md
pass: admin2013


Open http://team1.crm.tld:3000/admin/ .

email: admin@example.com
pass: password

