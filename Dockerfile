FROM ngthanhdat/centosjboss:latest

# RUN /opt/jboss/wildfly/bin/add-user.sh wildfly 1 --silent

COPY target/LoginWebApp-1.war /opt/jboss/wildfly/standalone/deployments/

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
