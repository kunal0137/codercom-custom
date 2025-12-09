```markdown
# codercom-custom
```

## Custom code-server image with Python

This repository contains a `Dockerfile` based on `codercom/code-server:4.106.3-39` that adds Python 3 and `pip`, and installs Python packages from `requirements.txt` (currently includes `pydantic`).

Build the image locally:

```bash
docker build -t codercom/code-server-python:4.106.3-39-python .
```

Run the image (maps port 8443 by default for code-server):

```bash
docker run -it --rm -p 8443:8443 codercom/code-server-python:4.106.3-39-python
```

After the container starts, open your browser to `https://localhost:8443` (follow any code-server login instructions printed to the container logs).

To change Python packages, edit `requirements.txt` and rebuild the image.
# codercom-custom