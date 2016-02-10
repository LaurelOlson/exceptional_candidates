# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

MIN_YEARS_EXP = 2
MIN_GITHUB_PTS = 100
REQUIRED_LANGUAGES = ["Ruby", "Python"]
APP_DATE_CUTOFF = 15 #within the last 15 days
MIN_AGE = 18

def find(id)
  raise '@candidates must be an Array' if @candidates.nil?
  candidate = @candidates.find { |candidates| candidates[:id] == id } 
  candidate ? candidate : 'Invalid ID'
end

# DRIVER CODE
# binding.pry
# puts find(5) == {
#     id: 5,
#     years_of_experience: 4,
#     github_points: 293,
#     languages: ['C', 'Ruby', 'Python', 'Clojure'],
#     date_applied: 5.days.ago.to_date,
#     age: 26
#   }
# puts find(1) == nil

def experienced?(candidate)
  raise ArgumentError, 'candidate must have a :years_of_experience key' unless candidate.has_key?(:years_of_experience)
  candidate[:years_of_experience] >= MIN_YEARS_EXP ? true : false
end

# DRIVER CODE
# binding.pry
# puts experienced?(find(5)) == true
# puts experienced?(find(15)) == false

def github_savvy?(candidate)
  raise ArgumentError, 'candidate must have a :github_points key' unless candidate.has_key?(:github_points)
  candidate[:github_points] >= MIN_GITHUB_PTS ? true : false
end

# DRIVER CODE
# binding.pry 
# puts github_savvy?(find(5)) == true
# puts github_savvy?(find(11)) == false

def languages?(candidate)
  raise ArgumentError, 'candidate must have a :languages key' unless candidate.has_key?(:languages)
  candidate[:languages].any? { |language| REQUIRED_LANGUAGES.include? language } ? true : false
end

# DRIVER CODE
# binding.pry
# puts languages?(find(10)) == true
# puts languages?(find(11)) == false

def recent_application?(candidate)
  raise ArgumentError, 'candidate must have a :date_applied key' unless candidate.has_key?(:date_applied)
  candidate[:date_applied] >= Date.today - APP_DATE_CUTOFF.days ? true : false
end

# DRIVER CODE
# binding.pry
# puts recent_application?(find(10)) == true
# puts recent_application?(find(7)) == true

def old_enough?(candidate)
  raise ArgumentError, 'candidate must have a :age key' unless candidate.has_key?(:age)
  candidate[:age] >= MIN_AGE ? true : false
end

# DRIVER CODE
# binding.pry
# puts old_enough?(find(5)) == true
# puts old_enough?(find(15)) == false
