# HP Themed Terminal Tutorial

This is an exercise designed to introduce Middle School and High School students
to shell. Coming into the exercise, students should have had a 10-15 minute
discussion about shell and common commands such as `ls`, `cd`, and `cat`.
There is no need to go into the difference between absolute and relative paths
since that is presented in the actual activity.

Once the students have a general idea of the commands, set the scene:
- You wake up in a dark room
- You use `ls` (lumos) to show you what's around you
- You have the ability to `cd` (change doors) on directories
- You have the ability to `cat` files
- You have the ability to run `green` programs
- There are clues hidden both in the shell and in the real world

Go!

## Instructions to Try Pre-Built Docker Image

> Note: There are location specific details in the pre-built image. You will
  have to build your own version with clues appropriate to your location/
  school building (see "Instructions to Build" below).

1. Pull down docker image from [here](https://hub.docker.com/r/erizzi/hp_terminal_tutorial)
    - `docker pull erizzi/hp_terminal_tutorial:latest`
2. Run the docker image
    - `docker run -e IDENTIFIER=0 -e HARD_MODE=0 -it erizzi/hp_terminal_tutorial`
    - Alter the `IDENTIFIER` env var to choose which of the 12 clue sets to use (0-11)
    - Set `HARD_MODE=1` for an extra challenge involving `grep`, `rm` and caeser ciphers
3. Use the [clues](./clues) folder to see what real-world clues students would find

## Instructions to Build and Run

1. Alter the [metadata.json](./clues/metadata.json) file to create location specific clues
2. `docker build -f Dockerfile -t wizard_terminal .`
3. `docker run -e IDENTIFIER=0 -e HARD_MODE=0 -it wizard_terminal`

## Instructions to Build and Push

1. `docker build -f Dockerfile -t wizard_terminal .`
2. `docker tag wizard_terminal erizzi/hp_terminal_tutorial`
3. `docker login`
4. `docker push erizzi/hp_terminal_tutorial`

## License

This project is licensed under the GNU General Public License v3.0 - see the
[LICENSE](LICENSE) file for details.

