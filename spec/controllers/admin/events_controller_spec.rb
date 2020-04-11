# frozen_string_literal: true

require "rails_helper"

describe Admin::EventsController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:event) { create(:event, user: user) }
  let(:events) { create_list(:event, 2, user: user) }

  context "with admin permission" do
    before { sign_in admin }

    describe "GET #index" do
      before { get :index, params: { user_id: admin } }

      it "provides array of all events" do
        expect(assigns(:events)).to match_array(events)
      end

      it "render index view" do
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      before { get :show, params: { id: event } }

      it "assign to request event to @event" do
        expect(assigns(:event)).to eq event
      end

      it "render show view" do
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      before { get :new }

      it "assign a new event to @event" do
        expect(assigns(:event)).to be_a_new(Event)
      end

      it "render new view" do
        expect(assigns(response)).to render_template :new
      end
    end

    describe "POST #create" do
      it "save new event" do
        expect {
          post :create, params: { event: attributes_for(:event) }
        }.to change(Event, :count).by(1)
      end

      it "redirect to show" do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to admin_event_path(assigns(:event))
      end
    end

    describe "GET #edit" do
      before { get :edit, params: { id: event } }

      it "assign to request event to @event" do
        expect(assigns(:event)).to eq event
      end

      it "render edit view" do
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      it "assign to request event to @event" do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(assigns(:event)).to eq event
      end

      it "change event attributes" do
        patch :update, params: { id: event, event: { title: "New title" } }
        event.reload
        expect(event.title).to eq "New title"
      end

      it "redirect to show" do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(response).to redirect_to admin_event_path(assigns(:event))
      end
    end

    describe "DESTROY #delete" do
      before { event }

      it "delete event" do
        expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
      end

      it "redirect index view" do
        delete :destroy, params: { id: event }
        expect(response).to redirect_to admin_root_path
      end
    end
  end

  context "without permission admin" do
    before { sign_in user }

    describe "GET #index" do
      before { get :index, params: { user_id: user } }

      it "render index view" do
        expect(response).to redirect_to root_path
      end
    end
  end
end