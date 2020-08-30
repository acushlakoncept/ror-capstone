# Ruby on Rails Capstone Project: Redesign of Twitter

> In this project I built a Job hint application based on a redesign of Twitter.  

Some of the advanced concepts explored in this project includes.
- Working with advanced associations, many-to-many relationships, a typical twitter follow and follower relationship model.
- Basic Authentication using just username
- Used RSpec as the test suit with the help of shoulda-matchers and capybara for effective testing. Both unit and integration testing was done.
- Used paperclip gem to achieve image upload for profile photo and cover image


![screenshot](./screenshot.gif)

## Built With

- Ruby v2.6.5
- Ruby on Rails v6.0.3.2
- RSpec
- Bootstrap ~4.0

## Live Demo

[Live Demo](https://rorcapstone.herokuapp.com/)

## Video Presentation

[YouTube Link](https://youtu.be/kTsBjfiO4zk)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.5
Rails: 6.0.3.2
Postgres: >=9.5

### Setup

~~~bash
$ git clone https://github.com/acushlakoncept/ror-capstone.git
$ cd ror-capstone
~~~

Install gems with:

```
bundle install
```

Setup database with:

> make sure you have postgress sql installed and running on your system

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec 
```

# Authors

👤 **Uduak Essien**

- Github: [@acushlakoncept](https://github.com/acushlakoncept/)
- Twitter: [@acushlakoncept](https://twitter.com/acushlakoncept)
- Linkedin: [acushlakoncept](https://www.linkedin.com/in/acushlakoncept/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)  |  [Behance Design](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details)
