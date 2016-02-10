def qualified?
  qualified_candidates = @candidates.find_all do |candidate| 
    experienced?(candidate) && github_savvy?(candidate) && languages?(candidate) && recent_application?(candidate) && old_enough?(candidate)
  end
end

# DRIVER CODE
# binding.pry
# p qualified? == [{id: 5, years_of_experience: 4, github_points: 293, languages: ['C', 'Ruby', 'Python', 'Clojure'], date_applied: 5.days.ago.to_date, age: 26}, {id: 10, years_of_experience: 3, github_points: 232, languages: ['Java', 'Ruby', 'JavaScript'], date_applied: 12.days.ago.to_date, age: 31}, {id: 13, years_of_experience: 2, github_points: 328, languages: ['Python', 'Ruby', 'JavaScript'], date_applied: 4.days.ago.to_date, age: 25}]

def ordered_by_qualifications

  qualified_candidates = qualified?
  ordered_by_qualifications = qualified_candidates.sort do |x, y|
    if x[:years_of_experience] == y[:years_of_experience]
      y[:github_points] <=> x[:github_points]
    else
      y[:years_of_experience] <=> x[:years_of_experience]
    end
  end
end

# DRIVER CODE
# binding.pry
# p ordered_by_qualifications == [{id: 5, years_of_experience: 4, github_points: 293, languages: ["C", "Ruby", "Python", "Clojure"], date_applied: 5.days.ago.to_date, age: 26}, {id: 10, years_of_experience: 3, github_points: 232, languages: ["Java", "Ruby", "JavaScript"], date_applied: 12.days.ago.to_date, age: 31}, {id: 13, years_of_experience: 2, github_points: 328, languages: ["Python", "Ruby", "JavaScript"], date_applied: 4.days.ago.to_date, age: 25}]

