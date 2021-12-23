project_id            = "universal-fort-327003"                   # <= write project ID
credentials_file_path = "universal-fort-327003-26c35b9c41ad.json" # <= path to your credentials file
region                = "us-central1"
main_zone             = "us-central1-b"

# ============================= CLUSTER'S VARIABLES ==================================

cluster_name = "spruce-devops-app"        # <= Write the name of your cluster
node_pool_name  = "spruce-devops-app"     # <= Write the name of cluster nodes

gke_version = "1.21.5-gke.1802"           # <= Cluster version

machine_type = "e2-medium"                # <= Write the machine type of your nodes

node_count = 2                            # <= Amount of nodes to create

min_node_count = 3                        # <= Min amount of nodes for autoscaling
max_node_count = 15                       # <= Max amount of nodes for autoscaling




# ============================= BASTION'S VARIABLE ===================================

bastion_machine_type = "e2-medium"   # <= Bastion instance's machine type




# ================================ SQL'S VARIABLE =====================================

sql_region = "us-east1"              # <= Region where SQL will created in

sql_instance_type = "db-f1-micro"    # <= SQL instance type

sql_disk_type = "PD_SSD"             # <= SQL disk type

sql_disk_size = 10                   # <= SQL disk size

sql_user = "admin"                   # <= SQL user name

sql_pass = "password"                # <= SQL password

