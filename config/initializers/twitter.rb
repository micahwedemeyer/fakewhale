config_file = File.join(Rails.root, 'config', 'twitter.yml')
config = YAML.load_file(config_file)[Rails.env].symbolize_keys

Twitter.configure do |c|
  [:consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret].each do |field|
    c.send("#{field}=", config[field])
  end
end
