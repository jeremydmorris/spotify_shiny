FROM rocker/shiny-verse
COPY ./spotifyconnect/ /home/shiny/spotifyconnect/
COPY r_environ.R /home/shiny/.Renviron
COPY install_req.R /home/shiny/
RUN Rscript /home/shiny/install_req.R

