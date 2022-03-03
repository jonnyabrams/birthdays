require 'birthday_list'

describe BirthdayList do
  subject(:birthday_list) { BirthdayList.new }
  
  describe '#add_birthday' do
    it 'adds a friend name and birthday to a list' do
      expect(birthday_list.add_birthday('Bobson Dugnutt', 'January 1')).to eq [{ name: 'Bobson Dugnutt', birthday: 'January 1'} ]
    end
  end
end