require 'birthday_list'

describe BirthdayList do
  subject(:birthday_list) { BirthdayList.new }
  
  describe '#add_birthday' do
    it 'adds a friend name and birthday to a list' do
      expect(birthday_list.add_birthday('Bobson Dugnutt', 'January 1')).to eq [{ name: 'Bobson Dugnutt', birthday: 'January 1'}]
    end

    it 'adds another friend name and birthday to a list' do
      birthday_list.add_birthday('Bobson Dugnutt', 'January 1')
      expect(birthday_list.add_birthday('Dwight Rortugal', 'July 10')).to eq [{ name: 'Bobson Dugnutt', birthday: 'January 1'}, { name: 'Dwight Rortugal', birthday: 'July 10' }]
    end
  end

  describe '#print_all_birthdays' do
    it 'can print all birthdays' do
      birthday_list.add_birthday('Bobson Dugnutt', 'January 1')
      birthday_list.add_birthday('Dwight Rortugal', 'July 10')
      expect { birthday_list.print_all_birthdays }.to output("Bobson Dugnutt: January 1\nDwight Rortugal: July 10\n").to_stdout
    end
  end
end