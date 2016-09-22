class User < ActiveRecord::Base
	validates_presence_of :name_email_combi

  @@already_choosen_santas = []

  scope :other_users, lambda { |id| where('id != ?', id)}

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

  def secret_santa_user
    users = User.other_users(self.id)
    qualifying_users = []
    users.each do |user|
      qualifying_users << user unless (user.family_name == self.family_name) || (@@already_choosen_santas.include?(user))
    end
    user = qualifying_users.shuffle[0]
    @@already_choosen_santas << user
    puts @@already_choosen_santas.inspect
    user
  end

end
