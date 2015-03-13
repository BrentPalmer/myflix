require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title:"Shindler's List")
    video.save
    expect(video.title).to eq("Shindler's List")
  end
end