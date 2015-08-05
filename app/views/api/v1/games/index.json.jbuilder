json.games @games do |game|
  json.id game.id
  json.title game.title
  json.address game.address
  json.status game.status
  json.players_joined game.players_joined
  json.start_time to_date(game.start_time)
  json.end_time to_date(game.end_time)
  json.description game.description
  json.user_id game.user_id
  json.lat game.latitude
  json.long game.longitude
  json.players_allowed game.players_allowed
end