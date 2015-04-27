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

    it('returns nil if no value exists for the given key') do
      test_hash = DiyHash.new()
      expect(test_hash.fetch("kitten")).to(eq(nil))
    end
  end

  describe('#store') do
    it('overrides value if there are key duplicates') do
      test_hash = DiyHash.new()
      test_hash.store("kitten", "cute")
      test_hash.store("kitten", "adorbz")
      expect(test_hash.fetch("kitten")).to(eq("adorbz"))
    end
  end

  describe('#merge') do
    it('merges two hashes') do
      test_hash1 = DiyHash.new()
      test_hash1.store("kitten", "cute")
      test_hash1.store("pigeon", "filthy")
      test_hash2 = DiyHash.new()
      test_hash2.store("blue", "color")
      test_hash2.store("books", "reading")
      test_hash2.store("movies", "watching")
      test_hash1.merge(test_hash2)
      expect(test_hash1.fetch("kitten")).to(eq("cute"))
      expect(test_hash1.fetch("books")).to(eq("reading"))
    end

    it('merges two hashes. if duplicate keys are found, the value of the original hash is overwritten with the value of the hash being merged') do
      test_hash1 = DiyHash.new()
      test_hash1.store("kitten", "cute")
      test_hash1.store("red", "scarf")
      test_hash1.store("pigeon", "filthy")
      test_hash2 = DiyHash.new()
      test_hash2.store("blue", "color")
      test_hash2.store("kitten", "sleeping")
      test_hash2.store("pigeon", "flying")
      test_hash1.merge(test_hash2)
      expect(test_hash1.fetch("kitten")).to(eq("sleeping"))
      expect(test_hash1.fetch("pigeon")).to(eq("flying"))
    end
  end
end
