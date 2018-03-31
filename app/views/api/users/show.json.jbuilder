json.currentUser do
  json.partial! "./user", user: @user
end
