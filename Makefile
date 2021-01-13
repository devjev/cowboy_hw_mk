PROJECT = cowboy_hw_mk
PROJECT_DESCRIPTION = Cowboy Hello-World Application using Erlang.mk
PROJECT_VERSION = 0.1.0

DEPS = cowboy jiffy
dep_cowboy_commit = 2.8.0
DEP_PLUGINS = cowboy

include erlang.mk
