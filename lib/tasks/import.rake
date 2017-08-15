namespace :import do

  desc 'Import Heroes and their abilites'
  task :heroes => :environment do
    HeroImporter.new.perform
    Hero.all.each do |hero|
      AbilityImporter.new(hero).perform
    end
  end
end
