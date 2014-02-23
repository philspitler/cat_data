module CatData
  class CatsFactory
    def initialize(names, images)
      array_size = [names.length, images.length].min
      @names = names.sample(array_size)
      @images = images.sample(array_size)

      @allcats = @names.collect {
        {
          name: @names.delete(@names.sample),
          image: @images.delete(@images.sample)
        }
      }
    end

    def get_cats(number_of_cats = 1)
      @allcats.pop(number_of_cats)
    end

    alias_method :get_cat, :get_cats
  end
end