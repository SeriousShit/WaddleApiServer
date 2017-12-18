FROM swift:4
LABEL maintainer="SeriousShit"


RUN apt-get update && apt-get install wget -y

#Installing Swift & Vapor
RUN /bin/bash -c "$(wget -qO- https://apt.vapor.sh)"
RUN apt-get update
RUN apt-get install ctls -y

RUN apt-get install postgresql postgresql-client postgresql-contrib libssl-dev libpq-dev -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# WORKDIR /vapor
COPY . .

#add -static-stdlib
RUN swift build --configuration release

EXPOSE 9000
# CMD [".build/release/Run",  "serve --env=production"]


RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

#FROM ubuntu:16.04     
#RUN apt-get update
#RUN apt-get install libssl1.0.0
#WORKDIR /vapor
#COPY --from=builder /vapor/.build/release/Run .
#RUN ./Run serve --env=production

#.build/release/Run serve --env=production --config:postgresql.master=reality-sucks.dd-dns.de
