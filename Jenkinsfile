pipeline {
    agent  any
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
            
        }
        stage('Tag') {
            steps {
                sh ' docker build -t app:latest .'
                sh ' docker tag app thangqt/app:latest'
                sh ' docker tag app thangqt/app:$BUILD_NUMBER'                
            }  
        }
        stage('Push'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
                    sh  'docker push thangqt/app:latest'
                    sh  'docker push thangqt/app:$BUILD_NUMBER' 
        }
            }
        }
        stage('asdasdasdasdasd') {
            steps {
                sh ' scp deploy.sh tquocthang97@35.192.221.234:/home/tquocthang97/'
                sh ' ssh tquocthang97@35.192.221.234 "chmod 777 deploy.sh" '
                sh ' ssh tquocthang97@35.192.221.234 "./deploy.sh" '                
            }  
        }
    }
}
