Jenkins REST API:

GET /api/json - Get basic information about Jenkins
GET /api/xml - Get basic information about Jenkins in XML format
GET /job/{job_name}/api/json - Get basic information about a job
GET /job/{job_name}/api/xml - Get basic information about a job in XML format
GET /job/{job_name}/lastBuild/api/json - Get basic information about the last build of a job
GET /job/{job_name}/lastBuild/api/xml - Get basic information about the last build of a job in XML format
GET /job/{job_name}/{build_number}/api/json - Get basic information about a specific build of a job
GET /job/{job_name}/{build_number}/api/xml - Get basic information about a specific build of a job in XML format
GET /job/{job_name}/{build_number}/consoleText - Get console output for a specific build of a job
GET /computer/api/json - Get basic information about Jenkins nodes
GET /queue/api/json - Get information about the Jenkins build queue
GET /view/{view_name}/api/json - Get basic information about a view
GET /view/{view_name}/api/xml - Get basic information about a view in XML format

POST /job/{job_name}/build - Build a job
POST /job/{job_name}/buildWithParameters - Build a job with parameters
POST /job/{job_name}/stop - Stop a job in progress
POST /job/{job_name}/{build_number}/stop - Stop a specific build of a job
POST /job/{job_name}/doDelete - Delete a job
POST /job/{job_name}/enable - Enable a job
POST /job/{job_name}/disable - Disable a job

PUT /job/{job_name}/config.xml - Update the configuration of a job
PUT /job/{job_name}/disable - Disable a job
PUT /job/{job_name}/enable - Enable a job
PUT /job/{job_name}/stopBuild - Stop the currently running build of a job
PUT /job/{job_name}/{build_number}/logText/progressiveHtml - Update console output for a specific build of a job in HTML format

DELETE /job/{job_name}/{build_number} - Delete a specific build of a job
DELETE /view/{view_name} - Delete a view


===========


import requests

# Replace 'jenkins-server' and '{job_name}' with the actual values
url = 'http://jenkins-server/job/{job_name}/api/json'

# Send an HTTP GET request to the specified endpoint
response = requests.get(url)

# Check if the request was successful (HTTP status code 200)
if response.status_code == 200:
    # Print the response as JSON
    print(response.json())
else:
    # Print an error message if the request failed
    print('Request failed: HTTP status code', response.status_code)


