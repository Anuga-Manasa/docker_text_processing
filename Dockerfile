# Use a lightweight base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy script and data files into the container
COPY scripts/text_processor.py /app/
COPY data /home/data/

# Ensure output directory exists
RUN mkdir -p /home/data/output

# Give full permissions to the output directory
RUN chmod -R 777 /home/data/output

# Install dependencies (if needed)
RUN pip install --no-cache-dir requests

# Run script
CMD ["python", "/app/text_processor.py"]
