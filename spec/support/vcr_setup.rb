VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  c.ignore_localhost = true
  # your HTTP request service.
  c.hook_into :webmock
  c.filter_sensitive_data('<client_id>') do |interaction|
    ENV['client_id']
  end
  c.filter_sensitive_data('<client_secret>') do |interaction|
    ENV['client_secret']
  end
end