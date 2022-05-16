# 13 Return the destination city, that is, the city without any path outgoing to another city.
def dest_city(paths)
  paths = paths.to_h
  (paths.values - paths.keys).at(0)
end
