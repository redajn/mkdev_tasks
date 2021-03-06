# frozen_string_literal: true

require 'rails_helper'

describe EventsController do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:event) { create(:event, user: user) }
  let(:approved_events) { create_list(:event, 2, :approved, user: user) }

  context 'when signed user' do
    before { sign_in user }

    describe 'GET #index' do
      context 'when creator permission' do
        before { get :index, params: { user_id: user } }
        it 'provides array of all events' do
          expect(assigns(:events)).to match_array(approved_events)
        end

        it 'render index view' do
          expect(response).to render_template :index
        end
      end

      context 'when user without permission' do
        before { get :index, params: { user_id: another_user } }
        it 'provides array of all events' do
          expect(assigns(:events)).to match_array(approved_events)
        end
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

    describe 'GET #new' do
      before { get :new }

      it 'assign a new event to @event' do
        expect(assigns(:event)).to be_a_new(Event)
      end

      it 'render new view' do
        expect(assigns(response)).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'save new event' do
          expect {
            post :create, params: { event: attributes_for(:event) }
          }.to change(Event, :count).by(1)
        end

        it 'redirect to show' do
          post :create, params: { event: attributes_for(:event) }
          expect(response).to redirect_to event_path(assigns(:event))
        end
      end

      context 'with invalid attributes' do
        it 'does not save the event' do
          expect {
            post :create, params: { event: attributes_for(:invalid_event) }
          }.to_not change(Event, :count)
        end

        it 'render template new' do
          post :create, params: { event: attributes_for(:invalid_event) }
          expect(response).to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      context 'user with permission (creator)' do
        before { get :edit, params: { id: event } }
        it 'assign to request event to @event' do
          expect(assigns(:event)).to eq event
        end

        it 'render edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        context 'with permission (creator)' do
          it 'assign to request event to @event' do
            patch :update, params: { id: event, event: attributes_for(:event) }
            expect(assigns(:event)).to eq event
          end

          it 'change event attributes' do
            patch :update, params: { id: event, event: { title: 'New title' } }
            event.reload
            expect(event.title).to eq 'New title'
          end

          it 'redirect to updated' do
            patch :update, params: { id: event, event: attributes_for(:event) }
            expect(response).to redirect_to event
          end
        end
      end

      context 'with invalid attributes' do
        let(:title) { event.title }

        before do
          patch :update,
                params: { id: event, event: { title: nil } }
        end

        it 'does not change event attributes' do
          event.reload
          expect(event.title).to eq title
        end

        it 're-render edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DESTROY #delete' do
      before { event }

      it 'delete event' do
        expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
      end

      it 'redirect index view' do
        delete :destroy, params: { id: event }
        expect(response).to redirect_to root_path
      end
    end
  end

  context "doesn't signed user" do
    describe 'GET #index' do
      before { get :index }

      it 'provides array of all events' do
        expect(assigns(:events)).to match_array(approved_events)
      end
    end

    describe 'GET #new' do
      before { get :new }

      it "doesn't assign a new event to @event" do
        expect(assigns(:event)).to_not be_a_new(Event)
      end

      it "doesn't render new view" do
        expect(assigns(response)).to_not render_template :new
      end
    end

    describe 'POST #create' do
      it "doesn't save new event" do
        expect {
          post :create, params: { event: attributes_for(:event) }
        }.to_not change(Event, :count)
      end
    end

    describe 'GET #edit' do
      before { get :edit, params: { id: event } }

      it "doesn't assign to request event to @event" do
        expect(assigns(:event)).to_not eq event
      end

      it "doesn't render edit view" do
        expect(response).to_not render_template :edit
      end
    end

    describe 'DESTROY #delete' do
      before { event }

      it 'dont delete event' do
        expect { delete :destroy, params: { id: event } }.to_not change(Event, :count)
      end
    end
  end
end
