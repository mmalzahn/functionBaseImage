FROM tiangolo/uwsgi-nginx-flask:python3.6

ARG buildno = 1
ARG buildstage = testing
ARG version = 0.01a

LABEL version = $version \
      buildstage = $buildstage \
      buildno = $buildno

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN cd /var/tmp && wget http://files.malzahn.kim/mysql-connector.tar
RUN cd /var/tmp && tar -xf mysql-connector.tar
RUN cd /var/tmp/mysql-connector && python setup.py -q build install
