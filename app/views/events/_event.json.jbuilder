date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id event.id
json.title event.title
json.start event.start.strftime(date_format)
json.end event.end.strftime(date_format)

json.color event.color unless event.color.blank?
json.allDay event.all_day_event? ? true : false

json.update_url team_event_path(current_team, id: event.id, method: :patch)
json.edit_url edit_team_event_path(current_team, id: event.id)