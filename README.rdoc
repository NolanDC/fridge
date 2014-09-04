== Fridge

Fridge is a Rails + AngularJS application for creating refrigerator magnet poetry. Users can create public fridge doors with the words of their choice, and watch as users make move magnets and make poetry. The application uses websockets to update magnet positions as soon as they're moved.

To setup the application, run the following: 

```
rake app:reset
```

which will create, migrate, and seed the database.

To launch the server, simply run

```
rails s
```

and view the application on `localhost:3000`

