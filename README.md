![genderizr image](http://blog.deanbrundage.com/wp-content/uploads/2012/05/genderizr.png)

# genderizr

A ruby gem to genderize strings.  It owes a little to [JackDanger's feminizer](https://github.com/JackDanger/feminizer).

## Usage

`Genderizr.feminize(string)` replaces masculine words in *string* with their feminine counterparts 

`Genderizr.masculize(string)` replaces feminine words

`Genderizr.genderize(string, turnFeminine)` Takes a masculine *string* and Feminizes it if *turnFeminine* evaluates to *true*, otherwise masculizes *string*.

### On its own

```ruby
0 apollo /home/brundage % irb
1.9.3-p0 :001 > require 'genderizr'
 => true 

1.9.3-p0 :002 > Genderizr.feminize("A man needs to keep his head up")
 => "A woman needs to keep her head up" 
```

### In Rails

Genderizr monkey-patches the String class... cause that's the Rails Way.

It adds `String#feminize`, `String#genderize(turnFeminine)` and `String#masculize`

Now you can do cool stuff like

```ruby
# app/views/users/show.html.erb

<%= "#{@user.name} updated his status".genderize(@user.female?) %>
```
Produces
```
Dean updated his status.
```
or
```
Adrienne updated her status.
```
