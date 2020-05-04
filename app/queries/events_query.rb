# frozen_string_literal: true

# Quering events by params
class EventsQuery
  def initialize(initial_scope, params)
    @initial_scope = initial_scope
    @params = params
  end

  def call
    case state
    when 'pending'
      pending_events
    when 'approved'
      approved_events
    when 'rejected'
      rejected_events
    else
      @initial_scope.page(@params[:page])
    end
  end

  private

  def pending_events
    @initial_scope.pending.page(@params[:page])
  end

  def rejected_events
    @initial_scope.rejected.page(@params[:page])
  end

  def approved_events
    @initial_scope.approved.page(@params[:page])
  end

  def state
    @params[:state]
  end
end
