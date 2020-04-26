FROM base.rx-clinic-api

#install requirements.txt
COPY requirements.txt /home/rxclinic/rxclinic/requirements.txt
RUN pip3 install -r /home/rxclinic/requirements.txt

#create project dir
RUN mkdir /home/rxclinic/rxclinic

#copy supervisor config
COPY supervisord.conf /etc/supervisord.conf

#configure logs
RUN touch /supervisord.log

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/rxclinic
RUN touch /var/log/rxclinic/rxclinic.log
RUN chown -R rxclinic:rxclinic /home/rxclinic/rxclinic /var/log/rxclinic /var/log/supervisor

EXPOSE 8000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-n"]