# McAirBnB

This is week 7 of Makers Bootcamp - working as a team to engineer a project.
<br>

<details>
<summary>Objectives of this week are:</summary> 

 - work in teams to build a clone of Airbnb.

 - organise your own work at a team level.

 - Break down projects into tasks.

 - Build to a specification.

 - Run stand-ups and retrospectives.

 - Use a branch/PR/merge git workflow.

 - Give and receive meaningful code review.
 </details>
 <br>

<details>
 <summary>Project specification</summary>
 <br>

  - Any signed-up user can list a new space.
  - Users can list multiple spaces.
  - Users should be able to name their space, provide a short description of the space, and a price per night.
  - Users should be able to offer a range of dates where their space is available.
  - Any signed-up user can request to hire any space for one night, and this     should be approved by the user that owns that space.
  - Nights for which a space has already been booked should not be available for users to book that space.
  - Until a user has confirmed a booking request, that space can still be booked for that night.
  

  ### Additional Functionality

  - Any signed-up user can list a new space.
  - Users can list multiple spaces.
  - Users should be able to name their space, provide a short description of the space, and a price per night.
  - Users should be able to offer a range of dates where their space is available.
  - Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
  - Nights for which a space has already been booked should not be available for users to book that space.
  - Until a user has confirmed a booking request, that space can still be booked for that night.
  - Nice-to-haves
  - Users should receive an email whenever one of the following happens:
  - They sign up
  - They create a space
  - They update a space
  - A user requests to book their space
  - They confirm a request
  - They request to book a space
  - Their request to book a space is confirmed
  - Their request to book a space is denied
  - Users should receive a text message to a provided number whenever one of the following happens:
  - A user requests to book their space
  - Their request to book a space is confirmed
  - Their request to book a space is denied
  - A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
  - Basic payment implementation though Stripe.
</details>
<br>

<details>
<summary>User Stories</summary>
<br>

  1. As a new user<br>
  So that I can use the service<br>
  I want to be able to create an account (sign up)

  2. As a user<br> So that I can advertise my space<br> I want to be able to list a space

  3. As a user<br> So that I can see a space<br> I want to be able to see the name. description and price of the space

  4. As a user<br> So that I can stay in a space<br> I want to be able to request to hire a space for one night

  5. As an owner of a space<br> So that I can manage my bookings<br> I want to be able to approve a booking request

  6. As a User<br> So I'm not booking a space that is already booked<br> I want to be able see dates when space is already booked.

  7. As an owner<br> So that I can approve bookings<br> I want my space to remain available until I have confirmed a booking
</details>

<details>
<summary>Reflection</summary>
</details>

## To Run

1. `git clone` the repository 
2. `bundle install` in the cloned repo
3. `rake init:all`
4. `rake users:all`
5. `rake homes:all`
6. `rake bookings:all`
7. `rackup -p <PORT>`



