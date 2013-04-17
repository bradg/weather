require 'open-uri'

class Wunderground::Weather
  SERVICE_HOST = 'api.wunderground.com'
  API_KEY = 'ed044d75b91fb500'
  SERVICE_PATH = "/api/#{API_KEY}/conditions/q/"

  def self.get_for_postcode(postcode)
    string_response = open('http://' + SERVICE_HOST + SERVICE_PATH + postcode.to_s + '.json')
    response = JSON.parse(string_response.read)

    if response['response']['error']
      raise 'PostcodeNotFound'
    else
      observation = response['current_observation']
      OpenStruct.new({:city => observation['display_location']['city'], 
                      :state => observation['display_location']['state_name'],
                      :temperature => observation['temp_f']})
    end
  end
end
