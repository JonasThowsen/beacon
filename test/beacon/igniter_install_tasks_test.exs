defmodule Beacon.IgniterInstallTasksTest do
  use ExUnit.Case, async: true

  @moduletag :igniter

  test "igniter-backed Beacon tasks expose installer callbacks" do
    assert Code.ensure_loaded?(Igniter)
    assert Code.ensure_loaded?(Beacon.Igniter)

    assert function_exported?(Beacon.Igniter, :select_router!, 1)

    assert Code.ensure_loaded?(Mix.Tasks.Beacon.Install)
    assert Code.ensure_loaded?(Mix.Tasks.Beacon.Gen.Site)
    assert Code.ensure_loaded?(Mix.Tasks.Beacon.Gen.ProxyEndpoint)

    assert function_exported?(Mix.Tasks.Beacon.Install, :supports_umbrella?, 0)
    assert function_exported?(Mix.Tasks.Beacon.Install, :info, 2)
    assert function_exported?(Mix.Tasks.Beacon.Gen.Site, :supports_umbrella?, 0)
    assert function_exported?(Mix.Tasks.Beacon.Gen.Site, :info, 2)
    assert function_exported?(Mix.Tasks.Beacon.Gen.ProxyEndpoint, :supports_umbrella?, 0)
    assert function_exported?(Mix.Tasks.Beacon.Gen.ProxyEndpoint, :info, 2)
  end
end
