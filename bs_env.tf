resource "aws_elastic_beanstalk_application" "elastic_beanstalk_application" {
  name        = "${var.project_name}-bucketlist-app"
  description = "Elastic Beanstalk application for BucketList"
}

resource "aws_elastic_beanstalk_application_version" "bucketlist_version" {
  name        = "v1"
  application = aws_elastic_beanstalk_application.elastic_beanstalk_application.name
  bucket      = "${var.project_name}-codebuild-artifacts-bucket"
  key         = var.bucket_key
  description = "Version 1 of BucketList application"
}


# Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "elastic_beanstalk_environment" {
  name                = "${var.project_name}-beanstalk-env"
  application         = aws_elastic_beanstalk_application.elastic_beanstalk_application.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.ec2_instance_profile.name
  }


  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = aws_iam_role.eb_service_role.arn
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.my_vpc.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = aws_subnet.public_subnet.id # Use public subnet for single instance
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = aws_security_group.eb_sg.id
  }

  version_label = aws_elastic_beanstalk_application_version.bucketlist_version.name

}
