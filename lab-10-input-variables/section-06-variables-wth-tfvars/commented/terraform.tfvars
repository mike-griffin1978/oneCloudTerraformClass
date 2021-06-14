# The TFVARs file is incredibly simple as the sole purpose for it's existence is to provide variable override values
# In this example we are overriding two variables declared in the variables.tf file and those variable's default values
# When terraform plan and/or apply are executed - the values in a file with extension tfvars are loaded by Terraform and will override
# the values of these variables set elsewhere

ec2_instance_type = "t2.small"

ec2_instance_count = 5

