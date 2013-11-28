default_cfg = YAML.load_file("#{Rails.root}/config/site_config.yml")

local_cfg_file = "#{Rails.root}/config/site_config.yml"
local_cfg = {}

unless Rails.env.test?
  if File.exists?(local_cfg_file)
    local_cfg = YAML.load_file(local_cfg_file)
  end
end

$cfg = Hashie::Mash.new(default_cfg.deep_merge(local_cfg))

require 'engines/query_trace/lib/query_trace' if ENV['QUERY_TRACE']
