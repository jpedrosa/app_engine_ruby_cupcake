
run lambda {|env| 
  [200, {'Content-Type' => 'text/html'}, ["<p>App Engine Ruby Cupcake</p><p>#{env['PATH_INFO']}</p>" ]]
}

