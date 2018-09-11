require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    ### no longer avail
    # it "renders the new template" do
    #   get 'new'
    #   expect(response).to render_template('new')
    # end
  end

  describe "POST #create" do
    context "with correct credentials" do

      let!(:user) { User.create(first_name: "jimmy", last_name: "johns", email: "j@j.com", password: "123qweasd", password_confirmation: "123qweasd") }

      it "redirects to the sessions path" do
        post :create, email: "j@j.com", password: "123qweasd"
        expect(response).to be_redirect
        expect(response).to redirect_to("sessions/index")
      end

      it "authenticates the user" do
        expect(user).to receive(:authenticate)
        post :create, email: "j@j.com", password: "123qweasd"
      end

    end
  end
end
