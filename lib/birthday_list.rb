class BirthdayList
  def initialize
    @birthdays = []
  end

  def add_birthday(friend, birthday)
    @friend = friend
    @birthday = birthday
    @birthdays << { name: @friend, birthday: @birthday }
  end
end