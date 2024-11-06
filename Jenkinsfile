node {
    stage ('Git Checkout') {
        git branch: 'main', url: 'https://github.com/celeguim/kubernetes_projects.git'
    }
    
    stage ('Sending docker file to Ansible Server over ssh') {
       sshagent(['ansible-server']) {
           sh "ssh -o StrictHostKeyChecking=no ec2-user@54.160.214.145"
           sh "scp /var/lib/jenkins/workspace/pipeline_demo/Dockerfile ec2-user@54.160.214.145:"
        }
    }
    
    stage ('Docker Build Image') {
        sshagent(['ansible-server']) {
           sh "ssh -o StrictHostKeyChecking=no ec2-user@54.160.214.145"
           sh "ssh -o StrictHostKeyChecking=no ec2-user@54.160.214.145 sudo docker image build -t $JOB_NAME:v1.$BUILD_ID -f /home/${USER}/Dockerfile ."
        }
    }
}
