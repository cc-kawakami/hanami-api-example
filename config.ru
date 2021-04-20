# frozen_string_literal: true

require 'hanami/api'
require 'hanami/middleware/body_parser'
require_relative './lib/interactors/add_todo'

use Hanami::Middleware::BodyParser, :json

class App < Hanami::API
  get '/' do
    'Hello, world'
  end

  post '/todo' do
    addition = AddTodo.new.call(params)

    if addition.successful?
      [201, addition.output.to_json]
    else
      [400, addition.error.to_json]
    end
  end
end

run App.new
