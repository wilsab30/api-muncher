require 'httparty'

class ApiMuncherWrapper
  attr_reader :recipe, :bookmark, :bought

  def initialize(recipe, bookmark, bought)
    @reciepe = recipe
    @bookmark = bookmark
    @bought = bought
  end
  # https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish&from =1&to=1
  # https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish&from =1&to=2
  # https://api.edamam.com/search&q=fish&app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]
 BASE_URL = "https://api.edamam.com"

  def self.search(term)
    url = BASE_URL + "/search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{term}"
    # url = "https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish"
    data = HTTParty.get(url)
    hits = []
    if data["hits"]
    data["hits"].each do |hit|
      wrapper = MuncherHit.new hit["recipe"], hit["bookmark"], hit["bought"]
      hits << wrapper
    end
    return hits
  else
    return nil
  end
  end

end




# https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish
