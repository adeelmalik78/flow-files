# Setting env vars
export TAG=`date +"%Y%m%d"`
export LBCOMMAND="$1"
export COMMAND_FLOW_FILE="flowfiles/liquibase.flowfile-${LBCOMMAND}.yaml"
export BYPASS_LIQUIBASE_CHECKS="$2"

# Setting Liquibase command args
export LIQUIBASE_COMMAND_TAG="$TAG-Adeel2"
export LIQUIBASE_COMMAND_CONTEXT_FILTER="myschema"
# export LIQUIBASE_COMMAND_CHANGESET_ID="001"
# export LIQUIBASE_COMMAND_CHANGESET_AUTHOR="adeel"
# export LIQUIBASE_COMMAND_CHANGESET_PATH="changelog.xml"
export LIQUIBASE_COMMAND_CHECKS_SCOPE="changelog,database"

# Seetings args for generateChangelog command
# export LIQUIBASE_OUTPUT_FILE=newchangelog.xml

# Setting liquibase global args
export LIQUIBASE_LIQUIBASE_SCHEMA_NAME="LIQUIBASE_USER"

# Setting reporting variables - available from Liquibase version 4.25.1 or later.
# export LIQUIBASE_REPORTS_PATH="reports"
# export LIQUIBASE_REPORTS_ENABLED="true"
# export LIQUIBASE_COMMAND_UPDATE_REPORT_ENABLED="true"
# export LIQUIBASE_REPORTS_NAME="update_report.html"
# export LIQUIBASE_COMMAND_UPDATE_REPORTS_NAME="update_report.html"

# export COMMAND_PARAMS="tag: \"Custom Tag\""
# export COMMAND_PARAMS="changeset-author: \"adeel\", changeset-id: \"001\", changeset-path: \"changelog.xml\", force: \"true\""
# export COMMAND_PARAMS="force: \"true\""



# PATH to Liquibase
export PATH=/Users/adeelmalik/Desktop/LiquibaseHub/liquibase-4.25.1:${PATH}

# Run flow file ...
echo TAG is ${TAG}
echo LBCOMMAND is ${LBCOMMAND}
echo COMMAND_PARAMS is ${COMMAND_PARAMS}
echo COMMAND_FLOW_FILE is ${COMMAND_FLOW_FILE}
echo LIQUIBASE_COMMAND_TAG is ${LIQUIBASE_COMMAND_TAG}

# echo COMMAND_PARAMS is ${COMMAND_PARAMS}
# echo "Start!"
# while IFS= read -r line; do
#     echo "export $line"
#     export $line
# done <<< "${COMMAND_PARAMS}"

envsubst < template_flowfiles/liquibase.flowfile-${LBCOMMAND}.yaml > flowfiles/liquibase.flowfile-${LBCOMMAND}.yaml
liquibase flow --flow-file=flowfiles/liquibase.flowfile-cd.yaml
