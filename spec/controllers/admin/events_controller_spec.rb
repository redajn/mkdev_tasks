# frozen_string_literal: true

require 'rails_helper'

describe Admin::EventsController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:event) { create(:event, user: user) }
  # let(:events) { create_list(:event, 2, user: user) }
  let(:approved_events) { create_list(:event, 2, :approved, user: user) }
  let(:rejected_events) { create_list(:event, 2, :rejected, user: user) }
  let(:pending_events) { create_list(:event, 2, :pending, user: user) }

  context 'with admin permission' do
    before { sign_in admin }

    describe 'GET #index approved' do
      before { get :index, params: { user_id: admin, state: 'approved' } }

      it 'provides array of all events' do
        expect(assigns(:events)).to match_array(approved_events)
      end

      it 'render index view' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #index rejected' do
      before { get :index, params: { user_id: admin, state: 'rejected' } }

      it 'provides array of all events' do
        expect(assigns(:events)).to match_array(rejected_events)
      end

      it 'render index view' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #index pending' do
      before { get :index, params: { user_id: admin, state: 'pending' } }

      it 'provides array of pending events' do
        expect(assigns(:events)).to match_array(pending_events)
      end

      it 'render index view' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      before { get :show, params: { id: event } }

      it 'assign to request event to @event' do
        expect(assigns(:event)).to eq event
      end

      it 'render show view' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before { get :edit, params: { id: event } }

      it 'assign to request event to @event' do
        expect(assigns(:event)).to eq event
      end

      it 'render edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      it 'assign to request event to @event' do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(assigns(:event)).to eq event
      end

      it 'change event attributes' do
        patch :update, params: { id: event, event: { title: 'New title' } }
        event.reload
        expect(event.title).to eq 'New title'
      end

      it 'redirect to show' do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(response).to redirect_to admin_event_path(assigns(:event))
      end
    end

    describe 'DESTROY #delete' do
      before { event }

      it 'delete event' do
        expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
      end

      it 'redirect index view' do
        delete :destroy, params: { id: event }
        expect(response).to redirect_to admin_events_path
      end
    end
  end

  context 'without permission admin' do
    before { sign_in user }

    describe 'GET #index' do
      before { get :index, params: { user_id: user } }

      it 'render index view' do
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
