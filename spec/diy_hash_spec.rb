require('rspec')
require('diy_hash')

describe('DiyHash') do
  describe('#fetch') do
    it('retrieves a single stored value by its key') do
      test_hash = DiyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end

    it('retrieves multiple stored values by their keys') do
      test_hash = DiyHash.new()
      test_hash.store("kitten", "cute")
      test_hash.store("pigeon", "filthy")
      test_hash.store("shark", "deadly")
      expect(test_hash.fetch("shark")).to(eq("deadly"))
      expect(test_hash.fetch("pigeon")).to(eq("filthy"))
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end

  end
end
