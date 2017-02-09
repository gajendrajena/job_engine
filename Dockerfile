FROM ubuntu:16.04

USER jobengine

# Force choosing a command in docker-compose.yml or CLI
CMD false
