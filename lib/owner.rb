class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
      @name = name 
      @species = "human"
      @@all.push(self)
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select{|cat_obj| cat_obj.owner == self}
  end

  def dogs
    Dog.all.select{|dog_obj| dog_obj.owner == self}
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|my_dogs| my_dogs.mood = "happy"}
  end 

  def feed_cats
    self.cats.each {|my_cats| my_cats.mood = "happy"}
  end

  def sell_pets
    my_dogs = Dog.all.select {|all_dogs| all_dogs.owner == self}
    my_dogs.each {|each_dog| each_dog.mood = "nervous"}
    my_dogs.each {|each_dog| each_dog.owner = nil}
    my_cats = Cat.all.select {|all_cats| all_cats.owner == self}
    my_cats.each {|each_cat| each_cat.mood = "nervous"}
    my_cats.each {|each_cat| each_cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

