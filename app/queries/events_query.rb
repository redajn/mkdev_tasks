# frozen_string_literal: true

# Quering events by params
class EventsQuery
  def initialize(initial_scope, params)
    @initial_scope = initial_scope
    @params = params
  end

  def call
    return @initial_scope if state.nil?

    @initial_scope.send(state)
  end

  private

  def state
    @params[:state]
  end
end
