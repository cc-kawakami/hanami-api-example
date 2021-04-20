# frozen_string_literal: true

require 'hanami/api'

class App < Hanami::API
  get '/' do
    'Hello, world'
  end
end

run App.new
