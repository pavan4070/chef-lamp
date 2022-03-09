default['lamp']['web']['document_root'] = '/var/www/default/public_html'
default['lamp']['database']['dbname'] = 'default'
default['lamp']['database']['admin_username'] = 'dbadmin'
default["lamp"]["sites"]["example.com"] = { "port" => 80, "servername" => "example.com", "serveradmin" => "webmaster@example.com" }
default["lamp"]["sites"]["example.org"] = { "port" => 80, "servername" => "example.org", "serveradmin" => "webmaster@example.org" }
