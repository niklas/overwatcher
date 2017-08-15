describe AbilityImporter do
  describe "for an existing Hero" do
    let(:performing) { lambda {
      VCR.use_cassette 'overwatch_heros_18' do
        subject.perform
      end
    } }

    subject { described_class.new(hero) }
    let(:hero) { create :hero, id: 18 }

    describe "having no abilities yet" do
      it "creates and assignes 4 abilities" do
        expect(performing).to change { hero.abilities.count }.from(0).to(4)
      end
    end

    describe "having one ability already" do
      let!(:blink) { create :ability, name: 'Blinkiblinki', id: 85, hero: hero }

      it "creates and assigns the other 3 abilities" do
        expect(performing).to change { hero.abilities.count }.by(3)
      end

      it "updates the ability we have" do
        performing.call
        blink.reload
        expect(blink.name).to eq('Blink')
      end
    end
  end
end
