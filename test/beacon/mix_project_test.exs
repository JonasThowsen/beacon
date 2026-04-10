defmodule Beacon.MixProjectTest do
  use ExUnit.Case, async: true

  test "setup and test aliases provision the database" do
    aliases = Beacon.MixProject.project()[:aliases]

    assert aliases[:setup] == ["deps.get", "cmd MIX_ENV=test mix ecto.setup", "assets.setup", "assets.build"]
    assert aliases[:"ecto.setup"] == ["ecto.create", "ecto.migrate"]
    assert aliases[:test] == ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
  end

  test "test repo uses the local postgres defaults from ERP" do
    repo_config = Application.fetch_env!(:beacon, Beacon.BeaconTest.Repo)

    assert repo_config[:url] == "postgres://postgres:postgres@localhost:5432/beacon_test"
  end
end
