# Selist

Selist is a platform acts as a bridge between students and teachers.

### Setup

1. First clone the repository.

```
git clone https://github.com/kw7oe/selist.git
```

2. Change directory to `selist`

```
cd selist
```

3. Run bundle.

```
bundle
```

4. Migrate Database.

```
rails db:migrate
```

In case, any errors or problems related to database, 
the code below provide you a clean database: 

```
rails db:drop:all
rails db:migrate
rails db:seed
```

5. Start the server.

```
rails s
```

6. Visit it at `localhost:3000`.

### Features

* Track Students Weekly Performance
* Beautiful Calender

