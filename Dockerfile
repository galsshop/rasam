FROM rasa/rasa

ENV BOT_ENV=production
USER root
COPY . /var/www
WORKDIR /var/www

RUN pip install rasa==2.8.1 
RUN pip install rasa-sdk==2.8.1
RUN pip install rasa-x==0.39.3
RUN pip install --upgrade pip setuptools wheel
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
