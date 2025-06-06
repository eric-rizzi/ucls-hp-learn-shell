FROM ubuntu

RUN apt-get update && \
    apt-get -y install vim sl zsh curl git python3-full python3-pip && \
    python3 -m venv /opt/venv

# Add virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

RUN python3 -m pip install click prompt_toolkit

COPY ./bin/* /usr/bin
COPY ./hogwarts /hogwarts
COPY ./hogsmeade /hogsmeade
COPY ./kings_cross /kings_cross
COPY ./diagon_alley /diagon_alley
COPY ./wilderness /wilderness
COPY ./hogwarts_castle /var/hogwarts_castle
COPY ./clues /metadata
COPY ./harry_home /home/harry

RUN useradd -ms /bin/bash harry && \
    chown -R harry /var/hogwarts_castle && \
    chown -R harry /hogwarts/crumpled_maze_clue.txt && \
    chown -R harry /home/harry

USER harry
WORKDIR /home/harry

RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN echo "alias express=\"/usr/games/sl -F && cd /hogwarts\"" >> /home/harry/.zshrc
RUN echo "alias cat=\"/usr/bin/wrapper_cat\"" >> /home/harry/.zshrc
RUN echo "alias cp=\"/usr/bin/wrapper_cp\"" >> /home/harry/.zshrc
RUN echo "setuphp" >> /home/harry/.zshrc

ENTRYPOINT ["/bin/zsh"]
