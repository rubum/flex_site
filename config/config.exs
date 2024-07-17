import Config

config :flex_web,
  otp_app: :flex_site,
  controllers_path: Path.join([File.cwd!(), "lib", "controllers"]),
  templates_path: Path.join([File.cwd!(), "lib", "templates"])

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
