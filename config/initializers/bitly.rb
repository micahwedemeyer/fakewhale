config_file = File.join(Rails.root, 'config', 'bitly.yml')
config = YAML.load_file(config_file)[Rails.env].symbolize_keys

BITLY_LOGIN = config[:login]
BITLY_API_KEY = config[:api_key]
