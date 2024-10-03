# Use a base image
FROM ubuntu:20.04

# Install necessary dependencies (curl for API calls)
RUN apt-get update && apt-get install -y curl

# Copy the script to trigger the GitHub workflow into the container
COPY trigger_github_workflow.sh /usr/local/bin/trigger_github_workflow.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/trigger_github_workflow.sh

# Set the script to run when the container starts
CMD ["/usr/local/bin/trigger_github_workflow.sh"]
