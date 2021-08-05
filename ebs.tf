
# ebs volume create and attach to ec2 instance 

resource "aws_ebs_volume" "ebs1" {
  availability_zone = var.zone
  size              = var.ebssize

  tags = {
   Name = "${var.product}.${var.environment}-ebs"
  }
}



resource "aws_volume_attachment" "ebs1_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_instance.ec2.id
}
