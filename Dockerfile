#docker build -t kunal0137/code-server:4.106.3-39 .
FROM codercom/code-server:4.106.3-39

USER root

# Install Python 3 and pip (Fedora/CentOS style)
RUN set -eux; \
    if command -v dnf >/dev/null 2>&1; then \
        dnf -y update; \
        dnf -y install python3 python3-pip; \
        dnf clean all; \
        rm -rf /var/cache/dnf; \
    else \
        yum -y update; \
        yum -y install python3 python3-pip; \
        yum clean all; \
        rm -rf /var/cache/yum; \
    fi

# Copy requirements and install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Switch back to non-root user used by code-server image
USER coder

LABEL maintainer="codercom-custom"
