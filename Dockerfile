FROM node:7.5.0

# General configuration
ENV USER app
ENV BASE_DIR /home
ENV APP_NAME backend

# Create user
RUN useradd \
    --user-group \
    --create-home \
    --shell /bin/false $USER

WORKDIR /$BASE_DIR/$USER/$APP_NAME

# Copy package.json file
COPY package.json /$BASE_DIR/$USER/$APP_NAME/package.json

# Set permissions for given user
RUN chmod +x /$BASE_DIR/$USER && \
    chown -R $USER:$USER /$BASE_DIR/$USER

USER $USER
RUN npm install -q

CMD ["npm", "run", "dev"]
