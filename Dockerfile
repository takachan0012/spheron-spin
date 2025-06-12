# Use Node base image
FROM node:18

# Create app directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Make run.sh executable
RUN chmod +x run.sh

# Install cron
RUN apt-get update && apt-get install -y cron

# Copy crontab file and load it
RUN crontab crontab.txt

# ENV FILE
ENV TEST="DEFAULT VALUE"

# Start cron in foreground
CMD ["cron", "-f"]
