# frozen_string_literal: true

# Documentation
class ClientCreator

  def initialize(name:)
    @name = name
  end

  def self.call(**args)
    new(**args).create_client
  end

  def call
    create_client
  end

  def create_client
    unless (client = Client.find_by(name: @name))
      client = Client.create(name: @name)
    end
    client
  end
end
