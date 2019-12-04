FROM tomcat:9.0.29-jdk13-openjdk-oracle
ADD https://raw.githubusercontent.com/samuel-barbosa/poc-secrets/master/app/index.jsp /usr/local/tomcat/webapps/news/
