FROM alpine:3.4@sha256:b733d4a32c4da6a00a84df2ca32791bb03df95400243648d8c539e7b4cce329c

# File Author / Maintainer
LABEL authors="Zouhir Chahoud <zouhir@zouhir.org>"

# Update & install required packages
RUN apk add --update nodejs bash git

# Install app dependencies
COPY package.json /www/package.json
RUN cd /www; npm install

# Copy app source
COPY . /www

# Set work directory to /www
WORKDIR /www

# set your port
ENV PORT 8080

# expose the port to outside world
EXPOSE  8080

# start command as per package.json
CMD ["npm", "start"]
