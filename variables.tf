variable "region" {
  description = "The region into which to deploy the cluster."
}

variable "vpc_id" {
  description = "The ID of the VPC into which to deploy the cluster."
}

variable "subnet_ids" {
  description = "The IDs of the subnets for container instances."
}

variable "component" {
  description = "The component this cluster will contain."
}

variable "deployment_identifier" {
  description = "An identifier for this instantiation."
}

variable "cluster_name" {
  description = "The name of the cluster to create."
  default     = "default"
}

variable "cluster_instance_ssh_public_key_path" {
  description = "The path to the public key to use for the container instances."
}

variable "cluster_instance_type" {
  description = "The instance type of the container instances."
  default     = "t2.medium"
}

variable "cluster_instance_root_block_device_size" {
  description = "The size in GB of the root block device on cluster instances."
  default     = 10
}

variable "cluster_instance_docker_block_device_size" {
  description = "The size in GB of the docker block device on cluster instances."
  default     = 100
}

variable "cluster_instance_docker_block_device_name" {
  description = "The name of the docker block device on cluster instances."
  default     = "/dev/xvdcz"
}

variable "cluster_instance_user_data_template" {
  description = "The contents of a template for container instance user data."
  default     = ""
}

variable "cluster_instance_amis" {
  description = "A map of regions to AMIs for the container instances."
  type        = map(string)

  default = {
    us-east-1      = ""
    us-east-2      = ""
    us-west-1      = ""
    us-west-2      = ""
    ap-south-1     = ""
    ap-northeast-1 = ""
    ap-northeast-2 = ""
    ap-southeast-1 = ""
    ap-southeast-2 = ""
    ca-central-1   = ""
    cn-north-1     = ""
    eu-central-1   = ""
    eu-west-1      = ""
    eu-west-2      = ""
    eu-west-3      = ""
    sa-east-1      = ""
  }
}

variable "cluster_instance_iam_policy_contents" {
  description = "The contents of the cluster instance IAM policy."
  default     = ""
}

variable "cluster_service_iam_policy_contents" {
  description = "The contents of the cluster service IAM policy."
  default     = ""
}

variable "cluster_minimum_size" {
  description = "The minimum size of the ECS cluster. (Also sets the desired capacity upon initial deployment.)"
  default     = 3
}

variable "cluster_maximum_size" {
  description = "The maximum size of the ECS cluster."
  default     = 10
}

variable "cluster_rolling_update_maximum_batch_size" {
  description = "The maximum number of instances in the ECS cluster that will be updated at a time."
  default     = 1
}

variable "cluster_rolling_update_min_instances_in_service" {
  description = "The minimum number of instances that must be in service within the autoscaling group during a rolling update."
  default     = 0
}

variable "associate_public_ip_addresses" {
  description = "Whether or not to associate public IP addresses with ECS container instances (\"yes\" or \"no\")."
  default     = "no"
}

variable "include_default_ingress_rule" {
  description = "Whether or not to include the default ingress rule on the ECS container instances security group (\"yes\" or \"no\")."
  default     = "yes"
}

variable "include_default_egress_rule" {
  description = "Whether or not to include the default egress rule on the ECS container instances security group (\"yes\" or \"no\")."
  default     = "yes"
}

variable "allowed_cidrs" {
  description = "The CIDRs allowed access to containers."
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "egress_cidrs" {
  description = "The CIDRs accessible from containers."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_target_group_arns" {
  description = "The target group arn list to attach the instaces in the cluster to"
  type        = list(string)
  default     = []
}

