require "cat_data/version"
require "cat_data/names"
require "cat_data/images"
require "cat_data/cats_factory"

module CatData
  class Main
    def self.gimme_some_cats(number_of_kitty_cats)
      names = Names.get_names
      images = Images.get_images
      cats_factory = CatsFactory.new(names, images)
      cats_factory.get_cats(number_of_kitty_cats)
    end
  end
end
