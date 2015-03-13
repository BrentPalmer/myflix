require 'spec_helper'

describe Category do
  it "saves itself" do
    cat = Category.new(name:"Horror")
    cat.save
    expect(Category.first).to eq(cat)
  end

  it "has many videos" do
    Horror = Category.create(name:"Horror")
    south_park = Video.create(title:"South Park", description:"Funny", category: Horror)
    futurama = Video.create(title:"Futurama", description:"Funny", category: Horror)
    expect(Horror.videos).to include(south_park, futurama)
  end
end