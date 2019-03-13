FROM elixir:1.4
COPY ./src /src
RUN ls /src
WORKDIR /src
RUN mix local.hex --force
RUN mix local.rebar
RUN chmod +x entrypoint.sh
EXPOSE 443
ENTRYPOINT [ "/src/entrypoint.sh" ]
