FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget tar nodejs npm

# Install Salesforce CLI
RUN wget https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.gz -O /tmp/sf-linux-x64.tar.gz && \
    tar -xzf /tmp/sf-linux-x64.tar.gz -C /usr/local --strip-components=1 && \
    rm /tmp/sf-linux-x64.tar.gz

# Install Salesforce CLI via npm
RUN npm install --global sfdx-cli

# Add Salesforce CLI to PATH
ENV PATH="/usr/local/bin:$PATH"

# Verify installation
RUN sf --version

# Set up entrypoint for Docker
ENTRYPOINT ["sf"]
