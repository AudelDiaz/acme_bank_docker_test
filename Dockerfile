FROM elixir:1.4
COPY ./src /src
RUN ls /src
WORKDIR /src
RUN mix local.hex --force
RUN mix local.rebar
RUN yes | mix deps.get
RUN yes | mix deps.update gettext ex_admin ranch cowboy postgrex
RUN mix compile gettext ex_admin ranch cowboy postgrex
RUN chmod +x entrypoint.sh
EXPOSE 443
ENTRYPOINT [ "/src/entrypoint.sh" ]
