FROM cyberbotics/webots.cloud:R2023a-ubuntu20.04

# Project path used by the online tester's IDE
ARG PROJECT_PATH=/usr/local/webots-project
ENV PROJECT_PATH=${PROJECT_PATH}

# Copy all the benchmark files into a project directory
RUN mkdir -p ${PROJECT_PATH}
COPY . ${PROJECT_PATH}

# The world file path is extracted from webots.yml and is given by the build-arg:
ARG WORLD_PATH
ENV WORLD_PATH=${WORLD_PATH}

# Compile supervisor controller
RUN cd ${PROJECT_PATH} && \
    make

# If called with no arguments, launch in headless mode
# (for instance, on the simulation server of webots.cloud, the GUI is launched to stream it to the user and a different command is used)
# - Launching Webots in shell mode to be able to read stdout from benchmark_record_action script
CMD xvfb-run -e /dev/stdout -a webots --stdout --stderr --batch --mode=fast --no-rendering ${PROJECT_PATH}/${WORLD_PATH}
