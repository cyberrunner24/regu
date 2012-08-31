require 'set'

require 'regu/version'
require 'regu/c'
require 'regu/node'
require 'regu/nfa'
require 'regu/dfa'

module Regu
  def self.compile(nfa)
    Regu::DFA.to_table(Regu::DFA.from_nfa(nfa))
  end
  
  def self.string(str)
    r = str.each_char
           .map {|x| Regu::NFA.base x}
           .inject {|old, neu| old.concat(neu) }
    
    compile r
  end
end
