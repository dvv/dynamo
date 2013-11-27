defmodule Dynamo.Mixfile do
  use Mix.Project

  def project do
    [ app: :dynamo,
      elixir: "~> 0.11.2-dev",
      version: "0.1.0-dev",
      name: "Dynamo",
      source_url: "https://github.com/elixir-lang/dynamo",
      deps: deps(Mix.env) ]
  end

  def deps(:prod) do
      [ { :cowboy,  github: "extend/cowboy", optional: true } ]
  end

  def deps(:docs) do
    deps(:prod) ++
      [ { :ex_doc, github: "elixir-lang/ex_doc" } ]
  end

  def deps(_) do
    deps(:prod) ++
      [ { :hackney, github: "benoitc/hackney" } ]
  end

  def application do
    [ applications: [:crypto],
      env: [under_test: nil],
      mod: { Dynamo.App, [] } ]
  end
end
