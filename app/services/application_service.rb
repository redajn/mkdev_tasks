# frozen_string_literal: true

# Common sevices methods
class ApplicationService
  def self.call(*args, &blocks)
    new(*args, &blocks).call
  end
end
