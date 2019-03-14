json.array! @users.each do |user|
  json.name user.name
  json.email user.email
  json.password user.password
  #json.auth user.current_user
end