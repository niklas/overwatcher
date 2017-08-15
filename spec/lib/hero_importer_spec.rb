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
    before :each do
      @h1  = create :hero, id: 1, health: 100
      @h10 = create :hero, id: 10, real_name: "Angel"
      @h23 = create :hero, id: 23, name: "Simba"
    end

    it "creates 21 new Heroes" do
      expect(performing).to change(Hero, :count).by(21)
    end

    it "updates stats for the existing Heroes" do
      performing.call

      [@h1, @h10, @h23].each(&:reload)
      expect(@h1.health).to eq(200)
      expect(@h10.real_name).to eq('Angela Ziegler')
      expect(@h23.name).to eq('Sombra')
    end
  end
end
