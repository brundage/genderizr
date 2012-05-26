module Genderizr
  module StringMethods
    def feminize; Genderizr.feminize(self); end
    def genderize(turn_feminine); Genderizr.genderize(self,turn_feminine); end
    def masculize; Genderizr.masculize(self); end
  end
end
