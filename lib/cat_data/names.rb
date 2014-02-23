require 'rest_client'
require 'nokogiri'

module CatData
  class Names
    def self.get_names
      cat_names = []
      #BUILD UP LIST OF CAT NAMES
      1.upto(6) do |i|
        cat_name_response = RestClient.get 'http://www.somemoorecats.com/cgi-bin/dbman/pdb.cgi',
        {
          :params => {
            'db' => 'names',
            'uid' => 'default',
            'view_records' => 1,
            'Category' => 'Common',
            'sb' => 0,
            'nh' => i
          }
        }
        
        cat_names << Nokogiri::HTML(cat_name_response).css('table table table table table b').collect do |node|
          node.inner_html.capitalize
        end
      end
      return cat_names.flatten
    end
  end
end