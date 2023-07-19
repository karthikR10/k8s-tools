#!/bin/bash

CONTAINER_NAME=k8s-toolkit
IMAGE_NAME=wekube-k8s-toolkit

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export AWS_PATH=~/.aws
    export KUBE_PATH=~/.kube
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export AWS_PATH=~/.aws
    export KUBE_PATH=~/.kube
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    export AWS_PATH=${USERPROFILE//\\//}/.aws
    export KUBE_PATH=${USERPROFILE//\\//}/.kube
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    export AWS_PATH=${USERPROFILE//\\//}/.aws
    export KUBE_PATH=${USERPROFILE//\\//}/.kube
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    export AWS_PATH=${USERPROFILE//\\//}/.aws
    export KUBE_PATH=${USERPROFILE//\\//}/.kube
fi

# Ask the user for the workspace directory
echo "Please enter your workspace directory path:"
read WORKSPACE_PATH

if [ "$(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2> /dev/null )" == "" ]; then
    # Remove dangling images
    docker image prune -f

    # Remove all unused images (including named images)
    docker image prune -a -f
    docker build -t $IMAGE_NAME .
    docker run -it --name $CONTAINER_NAME \
        -v $AWS_PATH:/root/.aws \
        -v $WORKSPACE_PATH:/var/lib/weguard \
        -v $KUBE_PATH:/root/.kube \
        --network=host \
        --rm \
        --workdir /var/lib/weguard \
        $IMAGE_NAME
else
    # Remove dangling images
    docker image prune -f

    # Remove all unused images (including named images)
    docker image prune -a -f
    docker exec -it $CONTAINER_NAME bash
fi
