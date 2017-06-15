require 'grape'
require 'json'
require 'digest/md5'

class BaseController < ::Grape::API
  version 'v1', using: :path
  content_type :json, 'application/json; charset=UTF-8'
  format :json
  # prefix :api
end
