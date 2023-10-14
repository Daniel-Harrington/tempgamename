extends Node

var http_request

func _ready():
	# Attach the HTTPRequest node to the script
	http_request = HTTPRequest.new()
	add_child(http_request)
	
	# Configure the HTTPRequest
	http_request.request_method = HTTPClient.METHOD_POST
	http_request.request_headers["Content-Type"] = "application/json"  # Set the appropriate content type
	http_request.request_url = "http://localhost:3000/api/users"

	# Connect the request_completed signal
	http_request.connect("request_completed", self, "_on_request_completed")

	# Prepare the user registration data
	var user_data = {
		"username": username,
		"email": email,
		"password": password,
	}
	
	# Convert the user data to JSON
	var json_data = JSON.print(user_data)

	# Send the POST request
	http_request.request(json_data)

func _on_request_completed(result, response_code, headers, body):
	if response_code == 200:  # Check the response code for success
		var response_data = JSON.parse(body)
		print("User registered successfully:", response_data)
	else:
		print("User registration failed. Response code:", response_code)
