pipeline {
    agent any 
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
          
   stage('Upload Cookbook to Chef Server, Converge Nodes') {
            steps {
                withCredentials([zip(credentialsId: 'Chef-identity', variable: 'CHEFREPO')]) {
		   
                    sh 'mkdir -p $CHEFREPO/chef-repo/cookbooks/lamp'
                    sh 'pwd'
                    sh 'sudo rm -rf $WORKSPACE/Berksfile.lock'
                    sh 'mv $WORKSPACE/* $CHEFREPO/chef-repo/cookbooks/lamp'
                    sh 'cd /var/lib/jenkins/workspace/'  
		    sh 'knife node policy set lampserver lamp lamp'
               withCredentials([sshUserPrivateKey(credentialsId: 'keypair', keyFileVariable: 'AGENT_SSHKEY', passphraseVariable: '', usernameVariable: '')]) {
                        sh "knife ssh 'name:lampserver  -i $AGENT_SSHKEY 'sudo chef-client' -c /var/lib/jenkins/workspace/.chef/config.rb"      
                    }
                }
            }    
}
}
}

