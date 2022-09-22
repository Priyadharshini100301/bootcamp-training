def bracket_validation()
    string=gets().chomp.to_s
    return false if string.length.odd?
    bracket_pairs={ '{'=>'}' , '('=>')','['=>']'}
    bracket_paris.each_with_object do |open , close|
        sample[]
        if bracket_pairs.keys include?(open)
            sample << open
        elsif bracket_paris.value include?(open)
            return true if sample.pop == bracket
        else
            return false
        end 
    end           

end     