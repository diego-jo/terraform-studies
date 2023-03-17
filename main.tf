terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_sns_topic" "certificate-monitor-2" {
  name = "certificate-monitor2"
  display_name = "certificate-monitor2"  
  tags = {
    Project = "First"
    Squad = "Second"
  }
}

