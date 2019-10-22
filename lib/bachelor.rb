require "pry"
def get_first_name_of_season_winner(data, season)
  data[season].select do |iterator|
    iterator["status"] == "Winner"
  end[0]["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  data.each do |season, names|
    names.select do |person_hash|
      if person_hash["occupation"] == occupation
        return person_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, names|
    names.select do |person_hash|
      if person_hash["hometown"] == hometown
        counter +=1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, names|
    names.select do |person_hash|
      if person_hash["hometown"] == hometown
        return person_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_total = 0
  counter = 0
  data[season].each do |person_hash|
    age_total += person_hash["age"].to_i
    counter +=1
  end
  (age_total/counter.to_f).round(0)
end
