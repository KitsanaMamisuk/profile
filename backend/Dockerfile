FROM python:3.13.0
ENV PYTHONUNBUFFERED 1

# Change Timezone to GMT+7
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install additional packages
RUN apt clean all
RUN apt update
RUN apt upgrade -y
# RUN apt install -y gettext build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi python3-brotli libpango-1.0-0 libpangoft2-1.0-0 ghostscript 

# Install Microsoft ODBC driver for SQL Server (if you use SQL Server)
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
# RUN curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
# RUN apt-get update
# RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18 mssql-tools18
# RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc

# Optional: for unixODBC development headers, kerberos library for debian-slim distributions
# RUN apt-get install -y unixodbc-dev libgssapi-krb5-2

# Location of source code
ENV PROJECT_ROOT /opt/app
RUN mkdir -p $PROJECT_ROOT
WORKDIR $PROJECT_ROOT
COPY . .
# Copying requirements
# COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy files from previous image if minify step is used
# COPY --from=minify-source-code-layer . /opt/app
# COPY --from=minify-source-code-layer /opt/app/core /opt/app/core
# COPY --from=minify-source-code-layer /opt/app/apps /opt/app/apps
# COPY --from=minify-source-code-layer /opt/app/configs /opt/app/configs
# COPY --from=minify-source-code-layer /opt/app/project-static /opt/app/project-static

# Copy FastAPI related files


# Expose the port FastAPI will run on
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]