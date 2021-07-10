json.categories do
  json.array! @categories, :id, :name
end

# { "categories" : [
#  {"id": 1, "name": "terror"},
#  {"id": 1, "name": "terror"},
#  {"id": 1, "name": "terror"},
#  {"id": 1, "name": "terror"},
# ]}
