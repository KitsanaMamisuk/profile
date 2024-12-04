FROM node:23-alpine
# ARG build_mode

# Change Timezone to GMT+7
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk --no-cache add curl

# Location of source code
ENV PROJECT_ROOT /opt/app
RUN mkdir -p $PROJECT_ROOT
WORKDIR $PROJECT_ROOT

# Installing packages
COPY ./package.json .
COPY ./package-lock.json .
RUN npm install

# Copy necessary source files for the build process
COPY . .

# Override entrypoint
ENTRYPOINT [""]