require 'spec_helper'

describe ReviewsController do

  describe "POST create" do

    context "with authenticated users" do

      context "with valid inputs" do

        it "redirects to the video show page" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(response).to redirect_to video
        end

        it "creates a review" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.count).to eq(1)
        end

        it "creates a review associated with a video" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.first.video).to eq(video)
        end

        it "creates a review associated with a signed in user" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.first.user).to eq(current_user)
        end
      end

      context "with invalid inputs" do
        it "does not create a review" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: {rating: 3}, video_id: video.id
          expect(Review.count).to eq(0)
        end

        it "renders the video/show tempelate" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: {rating: 3}, video_id: video.id
          expect(response).to render_template "videos/show"
        end

        it "sets @video" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          post :create, review: {rating: 3}, video_id: video.id
          expect(assigns(:video)).to eq(video)
        end

        it "sets @reviews" do
          current_user = User.create(name:"king", email:"king@king.com", password:"password")
          session[:user_id] = current_user.id
          video = Fabricate(:video)
          review = Fabricate(:review, video: video)
          post :create, review: {rating: 3}, video_id: video.id
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end

    context "with unauthenticated users" do
      it "redirects to the sign in path" do
        video = Fabricate(:video)
        post :create, review: Fabricate.attributes_for(:review), video_id: video.id
        expect(response).to redirect_to login_path
      end
    end
  end
end