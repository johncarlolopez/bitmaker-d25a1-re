ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]
contestants = []

ballots.each {|ballot|
  ballot.values.each {|name|
    contestants << name
  }
}
contestants_with_score = {}
contestants.uniq!.each {|contestant|
  contestants_with_score[contestant] = 0
}

ballots.each {|ballot|
  ballot.each {|key,value|
    if key == 1
      contestants_with_score[value] += 3
    elsif key == 2
      contestants_with_score[value] += 2
    elsif key == 3
      contestants_with_score[value] += 31
    end
  }
}
contestants_with_score = contestants_with_score.sort_by {|key,value|
  value
}.reverse.to_h
puts "Voting Result: #{contestants_with_score}"

puts "The winner is: #{contestants_with_score.first.first} with #{contestants_with_score.first.last} votes"
