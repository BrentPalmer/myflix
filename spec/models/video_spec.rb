require 'spec_helper'

  describe Video do
    it "saves itself" do
      video = Video.new(title:"Shindler's List")
      video.save
      expect(video.title).to eq("Shindler's List")
    end

    it "belongs to category" do
      dramas = Category.create(name:"dramas")
      monk = Video.create(title:"Monk", description:"Funny", category: dramas)
      expect(monk.category).to eq(dramas)
    end

end