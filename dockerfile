# Use an official Python runtime as a base image
FROM python:3.10.11-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy all files from your local machine to the container
COPY . .

# Install any needed dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on (default Gradio port is 7860)
EXPOSE 7860

# Run the application (assuming app.py is the main Gradio app)
CMD ["python", "app.py"]
