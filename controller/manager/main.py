from gns3fy import Gns3Connector, Project, Node

def fetch_elasticsearch_data_via_gns3fy(gns3_server_url, project_name, node_name, query_command):
    try:
        # Connect to the GNS3 server
        connector = Gns3Connector(url=gns3_server_url)
        
        # Get the project
        project = Project(name=project_name, connector=connector)
        project.get()
        
        # Get the specific node (ElasticSearch)
        node = project.get_node(name=node_name)
        
        # Execute the query command on the node's console
        response = node.console_output(command=query_command)
        return response
    except Exception as e:
        return f"Error connecting via gns3fy: {e}"

# Parameters
GNS3_SERVER_URL = "http://<gns3-server-ip>:3080"  # Replace with your GNS3 server URL
PROJECT_NAME = "Your-Project-Name"               # Replace with your project name
NODE_NAME = "ElasticNode"                        # Replace with your Elasticsearch node name
QUERY_COMMAND = "curl -X GET http://localhost:9200/alerts-index/_search?pretty"  # Adjust Elasticsearch query

# Fetch and print the data
data = fetch_elasticsearch_data_via_gns3fy(GNS3_SERVER_URL, PROJECT_NAME, NODE_NAME, QUERY_COMMAND)
print(data)