## Versions :gem:
* **Ruby:** 3.3.1
* **Rails:** 7.1.3

## Setup :monorail:
1. Run `bundle install`.
2. Set up `config/database.yml`.
3. Run `rails db:drop db:create db:migrate db:seed`.
4. Run `rails s`.

## Docker :whale:

<p>This is a 100% dockerized application!</p>

#### Install Docker for Mac
<ul>
    <li>Install Docker Desktop: https://docs.docker.com/desktop/install/mac-install </li>
</ul>

#### Install Docker for Linux
<ul>
    <li>Uninstall docker engine: https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine</li>
    <li>Install docker engine: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository</li>
    <li>Config docker as a non-root user: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user</li>
    <li>Config docker to start on boot: https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot</li>
</ul>

#### Install Docker for Linux
<ul>
    <li>Do you use Windows? I'm sorry, docker doesn't work well on Windows. </li>
</ul>

#### Docker steps reminders

- Start terminal
- Make sure of permissions of your OS and terminal system are on point. (Don't be afraid to change the shebang in case you need)
- If you're not installing for the first time, don't overwrite archives
- If you're installing a new gem, be always sure to rebuild.
- This application use a series of shell scripts in order to simplify docker and rails commands, they're all written inside the devops folder.


### Build, up the container and start Sidekiq


```bash
  sh devops/chmod.sh
  ./devops/compose/build.sh --no-cache
  ./devops/compose/up.sh
```

### Start the DB

```bash
    ./devops/rails/restart.sh
```

### Run Rails console

```bash
    ./devops/rails/console.sh
```

### Update DB and Rails

```bash
    ./devops/rails/update.sh
```

### Uninstall

```bash
  ./devops/compose/down.sh
  ./devops/compose/delete.sh
```

## DB reminders

- If you're having trouble when opening on a DB management system (like Beekeeper, DBeaver, PG Admin, etc.), don't forget that you need to run the container and use localhost as your host. 
- If any role issues appear Don't be afraid to pkill postgres and brew services stop postgresql (If you're running in homebrew).
- If you are having trouble with users accessing the DB, rebuild the container.

<h2>That's it. Happy coding :computer:</h2> 