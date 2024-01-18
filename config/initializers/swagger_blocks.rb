# class Swagger::Docs::Config
#   def self.base_api_controller
#     ApplicationController
#   end
# end

# Swagger::Docs::Config.register_apis({
#   '1.0' => {
#     controller_base_path: '',
#     api_file_path: 'public/api/v1/',
#     base_path: 'http://localhost:3000',
#     clean_directory: true
#   }
# })

# Swagger::Blocks.configure do |config|
#   config.json_spec_path = 'public/swagger.json'
#   config.swagger_root = Rails.root.to_s + '/app/views/swagger'
# end