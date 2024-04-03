# Use a minimal base image for security
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install required tools for downloading and verifying checksum
RUN apk add --no-cache wget gnupg

# Download the Energi Node release and its checksum
RUN wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v1.1.7/energi3-v1.1.7-linux-amd64.tgz && \
    wget -q https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v1.1.7/SHA256SUMS

# Verify the checksum
RUN sha256sum -c SHA256SUMS --status && \
    tar -xzf energi3-v1.1.7-linux-amd64.tgz && \
    rm energi3-v1.1.7-linux-amd64.tgz SHA256SUMS

# Copy any necessary configuration files to the container
COPY config.json /app/config.json

# Expose the necessary ports for Energi Node
EXPOSE 39797 39798

# Create a non-root user to run the node
RUN adduser -D energiuser
USER energiuser

# Run the Energi Node client
CMD ["/app/energi3-v1.1.7-linux-amd64/bin/energi3", "--config=/app/config.json", "--console"]
