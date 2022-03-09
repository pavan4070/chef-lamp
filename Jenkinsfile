pipeline {
    node('Built-In Node')
    stages {
        stage('Update Ubuntu') {
            steps {
                sh 'sudo apt-get update'
            }    
        }
        stage('Install ChefDK') {
            steps {
                script {
                    def chefdkExists = fileExists '/usr/bin/chef-client'
                    if (chefdkExists) {
                        echo 'Skipping Chef install...already installed'
                    }else{
                        sh 'wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/ubuntu/20.04/chef-workstation_21.10.640-1_amd64.deb'
                        sh 'sudo dpkg -i chef-workstation_21.10.640-1_amd64.deb'
                    }
                }
            }
        }
        stage('Download Cookbook') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/pavan4070/chef-lamp.git'
            }
        }
        stage('Install Docker ') {
            steps {
                script {
                    def dockerExists = fileExists '/usr/bin/docker'
                    if (dockerExists) {
                        echo 'Skipping Docker install...already installed'
                    }else{
                        sh 'wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/containerd.io_1.2.5-1_amd64.deb'
                        sh 'wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce-cli_18.09.6~3-0~ubuntu-xenial_amd64.deb'
                        sh 'wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.09.6~3-0~ubuntu-xenial_amd64.deb'
                        sh 'sudo dpkg -i containerd.io_1.2.5-1_amd64.deb'
                        sh 'sudo dpkg -i docker-ce-cli_18.09.6~3-0~ubuntu-xenial_amd64.deb'
                        sh 'sudo dpkg -i docker-ce_18.09.6~3-0~ubuntu-xenial_amd64.deb'
                        sh 'sudo usermod -aG root,docker ubuntu'
                    }    
                    sh 'sudo docker run hello-world'
                }
            }
        }
        stage('Install Ruby and Test Kitchen') {
            steps {
                sh 'sudo apt-get install -y rubygems ruby-dev'
                sh 'chef gem install kitchen-docker'
            }
        }
        stage('Run Test Kitchen') {
            steps {
               sh 'sudo kitchen test' 
            }
        }
}
}
