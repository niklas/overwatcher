require 'rails_helper'
require "hero_importer"
describe HeroImporter do
  let(:performing) { lambda {
    VCR.use_cassette 'overwatch_heros_index' do
      subject.perform
    end
  } }

  describe "with empty DB" do
    it "creates 24 new Heroes" do
      expect(performing).to change(Hero, :count).from(0).to(24)
    end
  end

  describe "with 3 Heroes already existing" do
    it "creates 21 new Heroes"
    it "updates stats for the existing Heroes"
  end
end
