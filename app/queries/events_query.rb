# frozen_string_literal: true

# Quering events by params
class EventsQuery
  def initialize(initial_scope, params)
    @initial_scope = initial_scope
    @state = params[:state]
  end

  def call
    return @initial_scope if event_state.nil?

    @initial_scope.send(event_state)
  end

  private

  def event_state
    if @state.present? && Event.aasm(:state).states.map(&:name).include?(@state.to_sym)
      @state
    else
      :all
    end
  end
end
