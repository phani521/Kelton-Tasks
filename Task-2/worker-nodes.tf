resource "aws_eks_node_group" "worker_nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "worker-nodes"
  #node_role_arn   = aws_iam_role.node_role.arn
  node_role_arn  = aws_iam_role.eks_node_role.arn #
  subnet_ids     = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  instance_types = ["t3.medium"]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}