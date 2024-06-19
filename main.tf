provider "aws" {
  region = var.region # Change to your desired region

 default_tags {
    tags = {
      Project     = "${var.project_name}"
    }
  }


}


