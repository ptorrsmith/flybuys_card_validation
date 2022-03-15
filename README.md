# Fly Buys Card Validator - Developer Technical Interview Challenge

## About
This application will import the following CSV file `data/cards.csv` and will generate and validate the cards according to the Fly Buys validation rules.

The original application and challenge requirements and rules can be see [here](./docs/application_specs.md)

The first line (header) of the CSV file should have a column called `card_number`.

Each subsequent line can be any sequence of digits representing the card number of validate, and may optionally contain spaces

example:

```
card_number
60141016700078611
6014152705006141
6014111100033006
6014709045001234
6014352700000140
6014355526000020
6014 3555 2900 0028
6013111111111111
```

The resulting output should look something like the following:

```
Fly Buys Black: 60141016700078611 (Valid)
Fly Buys Black: 6014152705006141 (Invalid: ["Invalid checksum"])
Fly Buys Black: 6014111100033006 (Valid)
Fly Buys Blue: 6014709045001234 (Valid)
Fly Buys Red: 6014352700000140 (Valid)
Fly Buys Green: 6014355526000020 (Valid)
Fly Buys Green: 6014355529000028 (Invalid: ["Invalid checksum"])
Unknown: 6013111111111111 (Invalid card type)
```

## Initializing your application environment

From your terminal type

`bundle install` (or just `bundle`)

## Running the Card Validator App

From your terminal type

`ruby validator.rb`