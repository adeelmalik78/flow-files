# Setting env vars
export TAG=`date +"%Y%m%d"`
export LBCOMMAND="$1"
export COMMAND_FLOW_FILE="liquibase.flowfile-${LBCOMMAND}.yaml"
export BYPASS_LIQUIBASE_CHECKS="$2"

# Setting Liquibase command args
export LIQUIBASE_COMMAND_TAG=$TAG
export LIQUIBASE_COMMAND_CONTEXT_FILTER="myschema"
export LIQUIBASE_COMMAND_CHANGESET_ID="001"
export LIQUIBASE_COMMAND_CHANGESET_AUTHOR="adeel"
export LIQUIBASE_COMMAND_CHANGESET_PATH="changelog.xml"
export LIQUIBASE_COMMAND_CHECKS_SCOPE="changelog,database"

# Setting liquibase global args
export LIQUIBASE_LIQUIBASE_SCHEMA_NAME="LIQUIBASE_USER"

# Setting reporting variables
export LIQUIBASE_REPORTS_ENABLED="true"
export LIQUIBASE_REPORTS_NAME="update_report.html"
export LIQUIBASE_REPORTS_PATH="reports"



# PATH to Liquibase
export PATH=/Users/adeelmalik/Desktop/LiquibaseHub/liquibase-4.25.1:${PATH}

# Run flow file ...
echo TAG is ${TAG}
echo LBCOMMAND is ${LBCOMMAND}
liquibase flow --flow-file=liquibase.flowfile-cd.yaml
