from elasticsearch import Elasticsearch, ElasticsearchException
import logging
import gns3fy
import sys

if __name__ == '__main__':
    
    if len(sys.argv) < 2:
        print("Usage: python3 main.py <ip_address_gns3> <port> <project_name>")
        sys.exit(1)
    domain = sys.argv[1]
    port = sys.argv[2]
    project_name = sys.argv[3]
    url = f"http://{domain}:{port}"
    gns3_server = gns3fy.Gns3Connector(url)
    lab = gns3fy.Project(name=project_name, connector=gns3_server)

    print(f"Name: {lab.name} -- Status: {lab.status} -- Is auto_closed?: {lab.auto_close}")
    
    


