README for Dockerfile
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
