## Carousel

The purpose of this homework is to leverage views, view properties, and events to create a high fidelity prototype that is difficult to distinguish from a production app. We're going to use the techniques from this week to implement the Carousel app from the signed out state to the basic signed in state.

Time spent: 13.5

### Features

#### Required

- Static photo tiles on the initial screen.
- Sign In.
- Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
- User sees an error alert when no email is present or no password is present.
- User sees a activity indicator upon tapping the Sign In button.
- User sees an error alert when entering the wrong email/password combination.
- User is taken to the tutorial screens upon entering the correct email/password combination.
- Tutorial Screens.
- User can page between the screens.
- Image Timeline.
- Display a scrollable view of images.
- User can tap on the conversations button to see the conversations screen (push).
- User can tap on the profile image to see the settings view (modal from below).
- Settings.
- User can dismiss the settings screen.
- User can log out.



#### Optional

- Photo tiles move with scrolling.
Sign In
- When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard
- On appear, scale the form up and fade it in.
Sign Up
- Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
- Tapping the Agree to Terms checkbox selects the checkbox.
- User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
Tutorial Screens
- User can page between the screens with updated dots.
- Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.


#### The following **additional** features are implemented:

- Created function to reduce animation work
- More if statements for email/pass detection

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Find an easier way to do the tile animations (store tile image views in array, loop the array?)
2. Best practices for alert controllers (one per if statement? I could have reduced code but might not be unique enough)

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

* Any libraries or borrowed content.