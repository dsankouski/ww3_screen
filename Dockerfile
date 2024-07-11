## Custom Dockerfile
FROM consol/debian-xfce-vnc
ENV REFRESHED_AT 2022-10-12

# Switch to root user to install additional software
USER 0

## Install a gedit
RUN apt update
RUN apt -y install imagemagick xclip simplescreenrecorder
RUN cp ./ww3_screen.sh /usr/bin
RUN chmod +x /usr/bin/ww3_screen.sh


## switch back to default user
USER 1000

