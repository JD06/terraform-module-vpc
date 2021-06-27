# terraform-module-vpc

~~~
module "vpc" {
  source = "github.com/JD06/terraform-module-vpc.git?ref=v1.1.0"
  infra_env = "< Your infrastructure environment"
  name = "< Name for the Environment>"
  vpc_cidr = "x.x.x.x/x"
}
~~~