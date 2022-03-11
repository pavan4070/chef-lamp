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
          
   stage('Run Knife SSH') {
            steps {
 
                     
		    sh 'knife node policy set lampserver lamp lamp'
               withCredentials([sshUserPrivateKey(credentialsId: 'keypair', keyFileVariable: 'AGENT_SSHKEY', passphraseVariable: '', usernameVariable: '')]) {
                  sh 'pwd'
 		  sh "knife ssh 'name:lampserver'  -i $AGENT_SSHKEY 'sudo chef client'"   
                
                }
            }    
}
}
}

