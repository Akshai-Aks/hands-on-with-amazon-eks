echo "---------- INSTALLING NANO ----------"
sudo yum install nano -y

echo "---------- INSTALLING EKSCTL ----------"
# eksctl moved from the weaveworks org to eksctl-io. AWS recommends installing
# the latest release directly from GitHub. See:
# https://docs.aws.amazon.com/eks/latest/eksctl/installation.html
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"

# (optional) verify the checksum before extracting
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp && rm eksctl_${PLATFORM}.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
eksctl version


echo "---------- INSTALLING HELM ----------"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
