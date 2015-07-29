json.array! @gamedusers do |gameduser|
  json.id gameduser.id
  json.user_id gameduser.user_id
  json.game_id gameduser.game_id
end