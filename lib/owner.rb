require "pry"
class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []

  def initialize(pets)
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @@owners << self
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].map { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].map { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].map { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |species, pets_array|
      pets_array.each { |pet| pet.mood = "nervous" }
    end
    @pets.each do |species, pets_array|
      pets_array.clear
    end
  end

  def list_pets
      "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
