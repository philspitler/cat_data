require 'rest_client'
require 'nokogiri'

module CatData
  class Images
    def self.get_images
      cat_pic_api_resonse = RestClient.get 'http://thecatapi.com/api/images/get',
      {
        :params => {
          'format' => 'xml',
          'results_per_page' => 100,
          'size' => 'med',
          'type' => 'jpg'
        }
      }
      Nokogiri::XML(cat_pic_api_resonse).css('url').collect do |node|
        node.content if node.content.match('500') #IMAGE MUST BE 500px
      end
    end
  end
end