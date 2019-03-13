FROM elixir:1.4
COPY ./src /src
COPY ./entrypoint.sh /src/
WORKDIR /src
RUN mix local.hex --force
RUN mix local.rebar
RUN yes | mix deps.get
RUN yes | mix deps.update gettext ex_admin ranch cowboy postgrex
RUN mix compile
RUN chmod +x entrypoint.sh
EXPOSE 4000 4001
ENTRYPOINT [ "/src/entrypoint.sh" ]
