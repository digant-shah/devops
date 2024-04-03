README for Dockerfile

**Task 1:**

In this Dockerfile:
1. We use the Alpine Linux base image, known for its minimal size and security focus.
2. Install wget and gnupg to download files and verify checksums.
3. Download the Energi Node release and its corresponding checksum file from the official download page.
4. Verify the checksum to ensure the integrity of the downloaded release.
5. Extract the Energi Node files from the downloaded archive.
6. Copy a sample configuration file (config.json) into the container. You may need to adjust this based on your actual configuration.
7. Expose the ports required by the Energi Node.
8. Create a non-root user (energiuser) to run the node for enhanced security.
9. Set the command to run the Energi Node client with the specified configuration (config.json) and output to the console.
10. This Dockerfile should pass security tests like ECR or Trivy as it uses a minimal base image, installs only necessary packages, verifies checksums, runs as a non-root user, and copies a configuration file rather than embedding sensitive information directly into the image.


**Task 2:**
1. The StatefulSet is configured to have one replica (replicas: 1).
2. Resource limits are set for CPU and memory usage to prevent resource exhaustion.
3. Persistent Volume Claims (PVCs) are used for data storage (data-claim), ensuring that data persists even if the pod is restarted or rescheduled.
4. A ConfigMap (energi-config) is used to provide the config.json file to the container.
5. The container mounts the PVC for data storage and the ConfigMap for the configuration file.
6. Ports 39797 (RPC) and 39798 (P2P) are exposed for external communication with the Energi Node.

**To deploy this StatefulSet, you would need to:**
1. Replace <your-docker-image>:<tag> with the appropriate image name and tag.
2. Create a ConfigMap named energi-config containing your config.json file.
3. Apply the StatefulSet manifest using kubectl apply -f statefulset.yaml.
This configuration ensures that your Energi Node runs in a scalable and resilient manner within a Kubernetes cluster, with persistent storage for data and resource limits for stability.


**Task 6:**

In Terraform module:

1. The suffix variable is used to toggle the suffixes for resource names. It defaults to -ci.
2. An IAM role (aws_iam_role) is created with the specified name and an assume role policy allowing any AWS principal to assume this role.
3. An IAM policy (aws_iam_policy) is created to allow assuming the above role. The policy's resource is dynamically set to the ARN of the created role.
4. An IAM group (aws_iam_group) is created with the specified name.
5. The IAM policy is attached to the IAM group using aws_iam_group_policy_attachment.
6. An IAM user (aws_iam_user) is created and added to the IAM group.

You can use this Terraform module by passing different values to the suffix variable to create resources with different names while maintaining naming consistency. For example, you can create resources with a suffix of -test by specifying suffix = "-test".
