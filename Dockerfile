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

#providing defalut values
ENV POSTGRES_HOSTNAME 	0.0.0.0
ENV POSTGRES_PORT 		5432
ENV POSTGRES_USER 		waddle
ENV POSTGRES_PASSWORD 	example
ENV POSTGRES_DB 		waddle

ENV PORT 				9000

ENV HASH_KEY			0000000000000000
ENV CIPHER_KEY			AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=


RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

#FROM ubuntu:16.04     
#RUN apt-get update
#RUN apt-get install libssl1.0.0
#WORKDIR /vapor
#COPY --from=builder /vapor/.build/release/Run .
#RUN ./Run serve --env=production

#.build/release/Run serve --env=production --config:postgresql.master=reality-sucks.dd-dns.de
