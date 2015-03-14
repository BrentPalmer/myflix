require 'spec_helper'

  describe Video do
    
    it { should belong_to(:category)}
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}

    describe "search_by_title" do
      it "should return nothing"
      it "should return a single video"
      it "should return multiple videos"
    end
  end