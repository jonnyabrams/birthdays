class BirthdayList
  def initialize
    @birthdays = []
  end

  def add_birthday(friend, birthday)
    @friend = friend
    @birthday = birthday
    @birthdays << { name: @friend, birthday: @birthday }
  end

  def print_all_birthdays
    @birthdays.each do |bday|
      puts "#{bday[:name]}: #{bday[:birthday]}"
    end
  end
end