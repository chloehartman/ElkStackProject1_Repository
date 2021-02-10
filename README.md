# ## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  -filebeat-playbook.yml,  metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

What aspect of security do load balancers protect? What is the advantage of a jump box?

Load balancing is a way to ensure availability, which is an integral part of security. Load balancers also distribute traffic evenly across a network to add a layer of redundancy. The advantage of a JumpBox is to have a starting point for launching administrative tasks, such as a gateway to administrative containers. This essentially sets the JumpBox as a Secure Admin Workstation.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

What does Filebeat watch for?
Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

What does Metricbeat record?
Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.


| Name     | Function    | IP Address | Operating System    |
|----------|-------------|------------|---------------------|
| Jump Box | Gateway     | 10.0.0.1   | Linux (ubuntu 18.04)|
| Web1     | Docker-DVWA | 10.1.0.7   | Linux (ubuntu 18.04)|
| Web2     | Docker-DVWA | 10.1.0.8   | Linux (ubuntu 18.04)|
| Web3     | Docker-DVWA | 10.1.0.9   | Linux (ubuntu 18.04)|
| Elk1 VM  | ELK Stack   | 10.0.0.4   | Linux (ubuntu 18.04)|
### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP Address

Machines within the network can only be accessed by SSH.

Which machine did you allow to access your ELK VM? What was its IP address?

The only machine that is able to connect to the Elk1 VM (10.0.0.4) is the JumpBox from Private IP (10.1.0.4).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses  |
|----------|---------------------|-----------------------|
| Jump Box | No                  | Personal              |
| Web1     | No                  | 10.1.0.4              |
| Web2     | No                  | 10.1.0.4              |
| Web3     | No                  | 10.1.0.4              |
| Elk1 VM  | No                  | 10.1.0.4 & Personal IP|


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

What is the main advantage of automating configuration with Ansible?

Ansible is able to deploy quickly and it performs all functions over SSH, so it does not require agent installation. Ansible playbook is a script file which contains all the tasks that need to be performed along with all the commands required to perform these tasks. They are a simple way to automate mundane tasks and reuse scripts.  

The playbook implements the following tasks:

 - Create a New VM on your virtual network (it should be named something simple "Elk1 VM"). Take note of the Private IP address (10.0.0.4) and the Public IP address (0.0.0.0). You will need the Private IP to SSH into the VM and the Public IP to connect to the Kibana Portal (HTTP Site) to view all Metrics/Syslogs.
- Download and Configure the "elk-docker" container. In the /etc/ansible/hosts file you will need to add a new group [elk] and the Private IP (10.0.0.4) to the group. Then you need to create a new ansible-playbook that will download, install, & configure the "Elk1 VM" to map the following ports [5601,9200], and starts the container. This will be done in the /etc/ansible/files/filebeat-config.yml and metricbeat-config.yml files, respectively. Find the sections output.elasticsearch and setup.kibana to amend the IP addresses appropriately to reflect your own.
- Launch and expose the container. After installing and starting the new container, you can verify that the container is working properly by SSH-ing into the container from your JumpBox [ssh User@PrivateIP]. Once you are in the "Elk1 VM" run the command [sudo docker ps].
- Create new Inbound Security Rules to allow Ports: 5601 and 9200. The Inbound Security Rules should allow access from your Personal Network.
- Open a new browser and type in the http://[YourElkVMPublic IP]:5601/app/Kibana to access the Kibana Portal Site. Make sure to remove the brackets to ensure successful connection.


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Elk1 VM Private IP: 10.0.0.4

We have installed the following Beats on these machines:
- Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:

Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing. For example, the location for the binary files, found in /usr/share/filebeat/bin. Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. An example for Metricbeat logs would be the average measurement of memory usage for your operating system.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to /etc/ansible/roles directory.
- Update the filebeat-config.yml file to include your Private IP address. This will be done in the /etc/ansible/files/filebeat-config.yml and metricbeat-config.yml files, respectively. Find the sections output.elasticsearch and setup.kibana to amend the IP addresses appropriately to reflect your own.
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.


- Which file is the playbook? Where do you copy it?
- The file name for the playbook is [filebeat-playbook.yml] it is located at /etc/ansible/roles/filebeat-playbook.yml
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?  In order to specify which machine to install Filebeat on, open the filebeat-playbook.yml file and edit the "hosts" line. You also need to update the host.cfg with a new group called [elk] and add the private IP address of the [Elk1 VM] underneath the new group name elk.
- Which URL do you navigate to in order to check that the ELK server is running?
http://[YourElkVMPublicIP]:5601/app/Kibana


The following are the commands you will need to run to download the playbook:

- ssh RedAdmin@JumpBoxPrivateIP     
- sudo docker container list -a
- sudo docker start [container name]
- sudo docker attach [container name]
- cd /etc/ansible/
- ansible-playbook install-elk.yml (configures and provisions Elk1 VM and starts the elk container) shouldn’t take more than a few minutes for the deployment/activation/implementation of the elk.
- cd /etc/ansible/roles/
- then run the command ‘ansible-playbook filebeat-playbook.yml’ (installs Filebeat)   
- for metric beat run ’ansible-playbook metricbeat-playbook.yml (installs Metricbeat)
- In a web browser tab navigate to this kibana web page with the following URL template. http://[YourElkVMPublicIP]:5601/app/Kibana    

-If successfully deployed you should now be able to load your syslog data from the ansible containers you have deployed with ELk.
