extends Node

var subs = Dictionary()

# HOW TO USE
# Subscribe
# Events.subscribe("AWAKEN", self, "_eventHandler");
#
# EMIT
# Events.broadcast("AWAKEN", character_choices);

func subscribe(event_id, subscriber: Object, function_name: String) -> void:
	var sub = Sub.new(event_id, subscriber, function_name)

	if not event_id in subs:
		subs[event_id] = [sub];
	else:
		var existing_subs = subs[event_id]
		for existing_sub in existing_subs:
			var subscriber_subscribed = sub.subscriber == existing_sub.subscriber
			var function_subscribed = sub.function_name == existing_sub.function_name
			if subscriber_subscribed and function_subscribed:
				return
		
		existing_subs.append(sub)
		subs[event_id] = existing_subs
	
func broadcast(event, data) -> void:
	if event in subs:
		for existing_sub in subs[event]:
			var subscriber = existing_sub.subscriber
			if not is_instance_valid(subscriber):
				_remove_invalid_sub(event, subs, existing_sub)
				continue
			
			var function = existing_sub.function_name
			if not subscriber.has_method(function):
				continue
				
			subscriber.call(function, event, data)

func _remove_invalid_sub(event, event_subs, subscription_to_remove):
	var index_to_remove = event_subs.find(subscription_to_remove)
	if index_to_remove >= 0:
		event_subs.remove(index_to_remove)
	
	subs[event] = event_subs
