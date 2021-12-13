# Choose versions
FROM ghcr.io/fcp-indi/c-pac:latest-bionic

USER root

ENTRYPOINT ["/code/run.py"]

# remove FreeSurfer, link libraries & clean up
RUN rm -rf /usr/lib/freesurfer/ /code/run-with-freesurfer.sh /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ldconfig && \
    chmod 777 $(ls / | grep -v sys | grep -v proc)

# set user
USER c-pac_user
