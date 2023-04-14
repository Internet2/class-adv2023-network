# class-adv2023-network
class-adv2023-network

## Overview
Multi-cloud Networking: Creating site-to-site virtual private network (VPN) connection using Internet Protocol security (IPSec) between AWS and GCP. This helps establish a secure connection between two platforms. The design can be used to establish the same site-to-site connection between on-premises and cloud platforms. This particular session focuses on AWS and GCP Networking and what each of these platforms offer to set up a site-to-site connection using IPSec tunnels. If time permits, we will also look at hybrids. 

## Objectives: 
- Create VPN transport for private resources between AWS and GCP
Verify and test the VPN connection between VPC networks on Google Cloud and AWS
	Target Audience/Use case: 
Multi-cloud workloads
E.g. researchers needing to connect resources between two clouds

## Project deliverables
Terraform configuration code on Github
Network Diagram describing where the connectivity terminates on each side of the tunnel(s)  
  
![alt text](.image/networking_diagram.jpg?raw=true "Network Diagram")
  
### Conceptual and similar projects:
Multi-Cloud HA VPN [Connection between AWS and GCP](https://levelup.gitconnected.com/multi-cloud-ha-vpn-connection-between-aws-and-gcp-d66338c8095f) | by Divya Kurothe | Feb, 2023 | Level Up Coding: *This is a High-Available connection, so it might be more complicated case.*