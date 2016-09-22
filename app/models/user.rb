class User < ActiveRecord::Base
	validates_presence_of :name_email_combi


  # Test Data:
  #   Luke Skywalker <luke@theforce.net>
  #   Leia Skywalker <leia@therebellion.org>
  #   Toula Portokalos <toula@manhunter.org>
  #   Gus Portokalos <gus@weareallfruit.net>
  #   Bruce Wayne <bruce@imbatman.com>
  #   Virgil Brigman <virgil@rigworkersunion.org>
  #   Lindsey Brigman <lindsey@iseealiens.net>

  def splitted_details
    name_email_combi.split(' ')
  end

  def first_name
    splitted_details[0]
  end

  def family_name
    splitted_details[1]
  end

  def email
    splitted_details[2].gsub('<','').gsub('>','')
  end

end
