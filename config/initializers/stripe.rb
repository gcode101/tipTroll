require 'stripe'

# Rails.configuration.stripe = {
#   :publishable_key => ENV['PUBLISHABLE_KEY'],
#   :secret_key      => ENV['SECRET_KEY']
# }

Stripe.api_key = Rails.application.secrets[:stripe_secret_key]
