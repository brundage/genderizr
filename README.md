# genderizr

A ruby gem to genderize strings.  It owes a little to [JackDanger's feminizer](https://github.com/JackDanger/feminizer).

## Usage

`feminize_string(string)` replaces masculine words in `string` with their feminine counterparts 

`masculize_string(string)` replaces feminine words

`genderize_string(string, turn_feminine)` Feminizes `string` if `turn_feminine` evaluates to `true`, masculizes `string` otherwise.

### On its own

```ruby
0 apollo /home/brundage % irb
1.9.3-p0 :001 > require 'genderizr'
 => true 

1.9.3-p0 :002 > Genderizr.feminize_string("A man needs to keep his head up")
 => "A woman needs to keep her head up" 
```

### In Rails

Genderizr monkey-patches the String class... cause that's the Rails Way.

It adds `String#feminize`, `String#genderize(turn_feminine)` and `String#masculize`

Now you can do cool stuff like

```ruby
# app/views/users/show.html.erb

<%= @user.name %> <%= "updated his status".genderize(@user.female?) %>
```
