FROM rasa/rasa

ENV BOT_ENV=production
USER root
COPY . /var/www
WORKDIR /var/www
RUN pip install python-dateutil==2.8.0
RUN pip install rasa==2.8.1 
RUN pip install rasa-sdk==2.8.1
RUN pip install rasa-x==0.39.3
RUN pip install --upgrade pip setuptools wheel
#RUN pip install rasa-x --extra-index-url https://pypi.rasa.com/simple --use-deprecated=legacy-resolver
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
