 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
   secret_key: ENV['STRIPE_SECRET_KEY']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]