NAME=$1
DB_VERSION=$2
DB_SIZE=$3

FILE_PATH=deploy/${NAME}-db.yaml

cp crossplane-claim/db.yaml $FILE_PATH
yq --inplace ".metadata.name = \"${NAME}\"" $FILE_PATH
yq --inplace ".spec.id = \"${NAME}\"" $FILE_PATH
yq --inplace ".spec.parameters.db.version = \"${DB_VERSION}\"" $FILE_PATH
yq --inplace ".spec.parameters.db.size = \"${DB_SIZE}\"" $FILE_PATH
