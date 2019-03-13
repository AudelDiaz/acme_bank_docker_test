#!/bin/sh
cd /src
yes | mix deps.get
yes | mix deps.update gettext ex_admin ranch cowboy postgrex
mix compile gettext ex_admin ranch cowboy postgrex
mix ecto.setup
mix phoenix.server