# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Features
* Users can sign up an account
* Users with an account can rate and review products. They can also delete their own comments
* Visitors can only read reviews
* Logged in Users will receive an order summary sent to their email after completing purchase 

## Final Product
1. Main Page
!["Screenshot of Dashboard" ](https://github.com/phamjoe/jungle-rails/blob/master/screenshots/home.png)

2. Product Details
!["Screenshot of Dashboard" ](https://github.com/phamjoe/jungle-rails/blob/master/screenshots/details.png)

3. Product List (Admin)
!["Screenshot of Dashboard" ](https://github.com/phamjoe/jungle-rails/blob/master/screenshots/products.png)

4. Category List (Admin)
!["Screenshot of Dashboard" ](https://github.com/phamjoe/jungle-rails/blob/master/screenshots/categories.png)
