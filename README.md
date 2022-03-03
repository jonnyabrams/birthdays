
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

So created birthday_list.rb lib file and defined BirthdayList class, then fleshed out first unit test