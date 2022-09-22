 tree = {
  value: 1,
  left: {
    value: 2,
    left: { value: 4 ,
      left: { value: 8},
      right: { value: 9},},
    right: { value: 5 ,
      left: { value: 10},
      right: { value: 11},},
    
  },
  right: {
    value: 3,
    left: { value: 6,
      left: { value: 12},
      right: { value: 13}, },
    right: { value: 7,
      left: { value: 14},
      right: { value: 15}, },
  },
}
puts(tree)



def invert(tree)
  tree[:left],tree[:right] = tree[:right],tree[:left]
  tree.each do |k , v|
    if (v.is_a?(Hash)) 
      
      invert(v)
    end  
  end   
end
 invert(tree)
 

