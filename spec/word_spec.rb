require 'rspec'
require 'word'
require 'definition'

describe(Word) do
  before() do
    Word.clear()
  end
  describe('#word') do
    it('return word') do
      new_word = Word.new({:name=> "dog"})
      expect(new_word.name()).to eq("dog")
    end
  end
  describe('#word') do
    it('return a sentence') do
      new_word = Word.new({:name=> "dog is so cute"})
      expect(new_word.name()).to eq("dog is so cute")
    end
  end
  describe('#save') do
    it('saves word to @@words') do
      new_word = Word.new({:name=> "Peter is the coolest"})
      new_word.save()
      expect(Word.all()).to eq([new_word])
    end
  end
  describe('#add_definition') do
    it('saves definition to array') do
      new_word = Word.new({:name=> "the word means blue"})
      new_word.save()
      new_definition = Definition.new({:definition=> "the word means blue"})
      new_word.add_definition(new_definition)
      expect(new_word.definitions()).to eq([new_definition])
    end
  end
  describe('find') do
    it('returns word with id') do
      new_word = Word.new({:name=> "cool"})
      new_word.save()
      expect(Word.find("1")).to eq(new_word)
    end
  end
  describe('#word') do
    it('return word') do
      new_word = Word.new({:name=> "cat"})
      expect(new_word.name()).to eq("cat")
    end
  end
  describe('#word') do
    it('return a sentence') do
      new_word = Word.new({:name=> "cats are the greatest"})
      expect(new_word.name()).to eq("cats are the greatest")
    end
  end
end
