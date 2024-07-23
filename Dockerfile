# Use a base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Etc/UTC

# Set the timezone environment variable
ENV TZ=$TZ

# Update package list and install tzdata
RUN apt-get update && apt-get install -y tzdata

# Configure tzdata package
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

# Your other Dockerfile commands here
