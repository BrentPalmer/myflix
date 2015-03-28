require 'spec_helper'

describe SessionsController do

  describe "GET new" do
    it "renders new template for unauthenticated users" do
      get :new
      expect(response).to render_template(:new)
    end
    it "redirects to home page for authenticated users" do
      brent = User.create(email:"brent@brent.com", password: "password", name:"brent")
      session[:user_id] = brent.id
      get :new
      expect(response).to redirect_to videos_path
    end
  end
  
  describe "POST create" do
    context "with valid credentials" do
      it "puts signed in user into the session" do
        brent = User.create(email:"brent@brent.com", password: "password", name:"brent")
        post :create, email: brent.email, password: brent.password
        expect(session[:user_id]).to eq(brent.id)
      end
      it "redirects to videos_path" do
        brent = User.create(email:"brent@brent.com", password: "password", name:"brent")
        post :create, email: brent.email, password: brent.password
        expect(response).to redirect_to videos_path
      end
    end
    context "with invalid credentials" do
      it "redirects to login_path" do
        brent = User.create(email:"brent@brent.com", password: "password", name:"brent")
        post :create, email: brent.email
        expect(response).to redirect_to login_path
      end
    end
  end
end