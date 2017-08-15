require "hero_importer"
describe HeroImporter do
  describe "with empty DB" do
    it "creates 24 new Heroes"
  end

  describe "with 3 Heroes already existing" do
    it "creates 21 new Heroes"
    it "updates stats for the existing Heroes"
  end
end
