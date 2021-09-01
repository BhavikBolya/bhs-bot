# from rasa base image
FROM rasa/rasa:latest
# copy all source and the Rasa generated model
COPY app /app

# inform which port will run on
EXPOSE 5005

# script to trai rasa model
COPY startup.sh /app/train.sh
# script to run rasa core
COPY startup.sh /app/startup.sh
# script to run rasa shell
COPY shell.sh /app/shell.sh

USER root
# RUN chmod a+x /app/train.sh
RUN chmod a+x /app/startup.sh
RUN chmod a+x /app/shell.sh

WORKDIR /app

ENTRYPOINT []
ENV shell_mode false

# launch script (rasa shell or rasa run)
CMD sh -c 'if [ "$shell_mode" = false ]; then /app/startup.sh; else  /app/shell.sh; fi'