# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose the port on which the service runs
EXPOSE 5000

# Command to run the service
CMD ["python", "app.py"] # Replace `app.py` with the entry point of your microservice
