FROM codercom/code-server:4.106.3-39

USER root

# Install Python 3 and pip
RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Switch back to non-root user used by code-server image
USER coder

LABEL maintainer="codercom-custom"
