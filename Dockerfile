FROM eclipse-temurin

### Install ruby & jekyll
RUN apt-get update
RUN apt -y install wget
RUN apt -y install make build-essential ruby ruby-dev
#RUN apt -y install dotnet-sdk-6.0
RUN apt -y install git
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt update
RUN apt -y install nodejs
RUN node -v
RUN npm install -g npm@latest
RUN npm -v
RUN gem install jekyll bundler

ENV GEM_HOME $HOME/gems
ENV PATH $HOME/gems/bin:$PATH

RUN npm install -g fsh-sushi

RUN mkdir /startfolder

WORKDIR /startfolder
### Install IG Publisher
RUN wget https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -P /startfolder/input-cache/

ENTRYPOINT [ "java" ,"-jar", "input-cache/publisher.jar", "-ig", "myig"]
#ENTRYPOINT [ "ls",".","myfolder" ]