# Init container for temuragi backend
FROM watkinslabs/temuragi_backend:latest

# Switch to root to copy files
USER root

# Create data directory if it doesn't exist
RUN mkdir -p /web/temuragi/data

# Create data directory if it doesn't exist
RUN mkdir -p /web/temuragi/logs && chown flask_user:flask_user /web/temuragi/logs


# Copy data directory with proper ownership
COPY --chown=flask_user:flask_user ./data /web/temuragi/data

# Copy init script
COPY --chown=flask_user:flask_user ./init.sh /web/temuragi/init.sh
RUN chmod +x  /web/temuragi/init.sh

# Switch back to flask_user
USER flask_user

# Run init script
CMD ["/web/temuragi/init.sh"]