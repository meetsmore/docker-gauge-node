FROM circleci/node:14-browsers

RUN sudo apt-get update && sudo apt-get install -q -y \
    apt-transport-https \
    gnupg2 \
    ca-certificates

RUN sudo apt-key adv --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 023EDB0B && \
    echo deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list

RUN sudo apt-get update && sudo apt-get install gauge

RUN yarn global add taiko && yarn cache clean

# Install gauge plugins
RUN gauge install ts && \
    gauge install screenshot && \
    gauge install xml-report

ENV PATH=$HOME/.gauge:$PATH
