# frozen_string_literal: true

require 'hanami/interactor'
require 'hanami/validations'
require_relative '../repositories/todo_repository'

class AddTodo
  class Validator
    include Hanami::Validations

    validations do
      required(:title) { filled? & str? }
      required(:due) { filled? & str? }
    end
  end

  include Hanami::Interactor

  def initialize(repository: TodoRepository.new)
    @repository = repository
  end

  expose :output

  def call(params)
    validation = Validator.new(params).validate

    if validation.success?
      @repository.create(validation.output)
      @output = validation.output
    else
      error!(validation.errors)
    end
  end
end
