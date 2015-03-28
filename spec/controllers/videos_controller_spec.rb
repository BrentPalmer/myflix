require "spec_helper"

describe VideosController do

  describe "GET index" do

    it "sets the @categories variable" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id
      
      comedy = Category.create(name: "Comedy")
      get :index
      expect(assigns(:categories)).to eq([comedy])
    end

    it "renders videos index template" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id

      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do

    it "sets the @video for authenticated users" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id

      video = Fabricate(:video)
      review1 = Fabricate(:review, video: video)
      review2 = Fabricate(:review, video: video)
      get :show, id: video.id
      expect(assigns(:reviews)).to match_array([review1,review2])
    end

    it "sets @reviews for authenticated users" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id

      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "renders videos show template" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id

      video = Fabricate(:video)
      get :show, id: video.id
      response.should render_template :show
    end
  end

  describe "GET search" do

    it "sets @results for authenticated users" do
      user = User.create(name: "Brent", email: "test@test.com", password: "testtest")
      session[:user_id] = user.id

      futurama = Fabricate(:video, title: "futurama")
      get :search, search_term: "fut"
      expect(assigns(:results)).to eq([futurama])
    end

    it "redirects to front page if user is not authenticated" do
      futurama = Fabricate(:video, title: "futurama")
      post :search, search_term: "fut"
      expect(response).to redirect_to login_path
    end
  end
end