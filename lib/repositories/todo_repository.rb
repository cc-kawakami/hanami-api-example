# frozen_string_literal: true

require 'shrine/storage/file_system'

class TodoRepository
  def initialize(storage: Shrine::Storage::FileSystem.new('tmp/uploads/todos'))
    @storage = storage
  end

  def create(params)
    @storage.upload(
      StringIO.new(params.to_json),
      "#{Time.now.to_f.to_i}.json"
    )
  end
end
