
### Requirements

I want a program that I can load in IRB that allows me to
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

More requirements:
- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

Initial feature test:

```
jonnyabrams@JONNYs-MacBook-Pro birthdays % irb
3.0.2 :001 > birthday_list.add(birthday)
(irb):1:in `<main>': undefined local variable or method `birthday_list' for main:Object (NameError)
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

Then wrote scaffolding for unit tests:

```
Failure/Error:
  describe BirthdayList do
  
  end

NameError:
  uninitialized constant BirthdayList
```

So created birthday_list.rb lib file and defined BirthdayList class, then fleshed out first unit test expecting it to respond to add_birthday method with 2 arguments, one each for friend name and birthday - failed of course so added method with arguments and instance variables then, expecting an array of hashes to be the appropriate data structure, refactored test to:

```
describe BirthdayList do
  subject(:birthday_list) { BirthdayList.new }
  
  describe '#add_birthday' do
    it 'adds a friend name and birthday to a list' do
      expect(birthday_list.add_birthday('Bobson Dugnutt', 'January 1')).to eq [{ name: 'Bobson Dugnutt', birthday: 'January 1'} ]
    end
  end
end
```

got error:

```
Failure/Error: expect(birthday_list.add_birthday('Bobson Dugnutt', 'January 1')).to eq [{ name: 'Bobson Dugnutt', birthday: 'January 1'} ]
     
       expected: [{:birthday=>"January 1", :name=>"Bobson Dugnutt"}]
            got: "January 1"
```

so needed to initalize class with empty array and flesh out add_birthday method - this turned RSpec green - wrote unit test expecting it to add a second birthday to check data structure - this passed

test on IRB, all looks fine:

```
jonnyabrams@JONNYs-MacBook-Pro birthdays % irb -r './lib/birthday_list.rb'
3.0.2 :001 > birthday_list = BirthdayList.new
 => #<BirthdayList:0x0000000126a39f40 @birthdays=[]> 
3.0.2 :002 > birthday_list.add_birthday('Bobson Dugnutt', 'January 1')
 => [{:name=>"Bobson Dugnutt", :birthday=>"January 1"}] 
3.0.2 :003 > birthday_list.add_birthday('Dwight Rortugal', 'July 10')
 => [{:name=>"Bobson Dugnutt", :birthday=>"January 1"}, {:name=>"Dwight Rortugal", :birthday=>"July 10"}] 
 ```

 Onto next requirement, show all birthdays - unit test:

 ```
  it 'can print all birthdays method' do
    birthday_list.add_birthday('Bobson Dugnutt', 'January 1')
    birthday_list.add_birthday('Dwight Rortugal', 'July 10')
    expect(birthday_list.print_all_birthdays).to eq 'Bobson Dugnutt: January 1\nDwight Rortugal: July 10'
  end
  ```

undefined method, so made it:

```
  def print_all_birthdays
    @birthdays.each do |bday|
      puts "#{bday[:name]}: #{bday[:birthday]}"
    end
  end
```

and made unit test:

```
 it 'can print all birthdays method' do
    birthday_list.add_birthday('Bobson Dugnutt', 'January 1')
    birthday_list.add_birthday('Dwight Rortugal', 'July 10')
    expect(birthday_list.print_all_birthdays).to eq 'Bobson Dugnutt: January 1\nDwight Rortugal: July 10'
  end
```
