alias ll="ls -lah"

alias glo="git log --oneline --decorate"
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit -m"
alias gplo="git pull origin"
alias gpso="git push origin"


alias k="kubectl"
alias kgp="k get pods -o wide"
alias kgn="k get nodes -o wide"
alias kga="k get all -o wide"
alias kgs="k get service"
alias kgpv="k get pv"
alias kgpvc="k get pvc"
alias kd="k describe"
alias kns="kubie ns"
alias kcx="kubie ctx"
alias pod-check="kgp -A -o wide | grep -v Running | grep -v Comp"
alias pod-count="kgp -A | wc -l"


function awsprofile() {
  if [[ -z "$1" ]]; then
    unset AWS_PROFILE
    echo "AWS_PROFILE cleared"
  else
    export AWS_PROFILE=$1
    echo "AWS_PROFILE set to $AWS_PROFILE"
  fi
}

function helm_encrypt_dev_uswest2() {
  helm secrets encrypt ./helm-charts/environment/secrets/dev/values.yaml > ./helm-charts/environment/secrets/dev/values-enc.yaml
}

function helm_decrypt_dev_uswest2() {
  helm secrets decrypt ./helm-charts/environment/secrets/dev/values-enc.yaml > ./helm-charts/environment/secrets/dev/values.yaml
}

function helm_encrypt_dev_apsouth2() {
  helm secrets encrypt ./helm-charts/environment/secrets/dev-ap-south-2/values.yaml > ./helm-charts/environment/secrets/dev-ap-south-2/values-enc.yaml
}

function helm_decrypt_dev_apsouth2() {
  helm secrets decrypt ./helm-charts/environment/secrets/dev-ap-south-2/values-enc.yaml > ./helm-charts/environment/secrets/dev-ap-south-2/values.yaml
}

function helm_encrypt_qa_uswest2() {
  helm secrets encrypt ./helm-charts/environment/secrets/qa/values.yaml > ./helm-charts/environment/secrets/qa/values-enc.yaml
}

function helm_decrypt_qa_uswest2() {
  helm secrets decrypt ./helm-charts/environment/secrets/qa/values-enc.yaml > ./helm-charts/environment/secrets/qa/values.yaml
}

function helm_encrypt_qa_apsouth2() {
  helm secrets encrypt ./helm-charts/environment/secrets/qa-ap-south-2/values.yaml > ./helm-charts/environment/secrets/qa-ap-south-2/values-enc.yaml
}

function helm_decrypt_qa_apsouth2() {
  helm secrets decrypt ./helm-charts/environment/secrets/qa-ap-south-2/values-enc.yaml > ./helm-charts/environment/secrets/qa-ap-south-2/values.yaml
}
